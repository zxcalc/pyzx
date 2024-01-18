import os
import sys
import dill # type: ignore
import numpy as np
from pyzx.circuit import Circuit
import random
from typing import Callable, Dict, List, Set, Tuple, Optional, Union
import pandas as pd
from IPython.display import display
from tqdm import tqdm # type: ignore
from time import perf_counter
import matplotlib.pyplot as plt
import pyzx as zx

plt.style.use('seaborn-whitegrid')
pd.set_option('display.max_columns', None)
pd.set_option('display.max_rows', None)
pd.set_option('display.max_colwidth', None)

class Benchmark:
    """Class for benchmarking circuit simplification functions"""
    def __init__(self, dirpath: Optional[str] = None):
        # callable functions which take simplify a circuit: {func_name: func}
        self.funcs: Dict[str, Callable[..., Circuit]] = dict()
        # list of simlification strategies of which the simplified circuits have been directly imported 
        self.routines: Set[str] = set()
        # unsimplified circuits: {group_name: [circuit_names]}
        self.circuit_groups: Dict[str, List[str]] = dict()
        # simplified circuits: {circuit_name: {func_name: [circuit, qubit_count, gate_count, 2_count, T_count, t_opt]}}
        self.circuits: Dict[str, Dict[str, List[Union[Circuit, int, Optional[float]]]]] = dict()
        # randomly generated circuit data {parameters: [seed, {func_name: [gate_count, 2_count, T_count]}]}
        self.rand_data:  Dict[str, List[Union[int, Dict[str, List[float]]]]] = dict()
        
        if dirpath: # load from saved files
            if not os.path.isdir(dirpath): raise Exception(f'{dirpath} is not a directory.')
            try:
                with open(dirpath+'/funcs.pkl', 'rb') as f:
                    self.funcs = dill.load(f)
                with open(dirpath+'/circuit_groups.pkl', 'rb') as f:
                    self.circuit_groups = dill.load(f)
                with open(dirpath+'/circuits.pkl', 'rb') as f:
                    self.circuits = dill.load(f)
                with open(dirpath+'/rand_data.pkl', 'rb') as f:
                    self.rand_data = dill.load(f)
                with open(dirpath+'/routines.pkl', 'rb') as f:
                    self.routines = dill.load(f)
            except: raise Exception(f'{dirpath} does not contain the correct datafiles')
                
    def save(self, dirpath: str) -> None:
        """Saves the benchmark data to dirpath"""
        if not os.path.isdir(dirpath): raise Exception(f'{dirpath} is not a directory.')
        with open(dirpath+'/funcs.pkl', 'wb') as f:
            dill.dump(self.funcs,f)
        with open(dirpath+'/circuit_groups.pkl', 'wb') as f:
            dill.dump(self.circuit_groups,f)
        with open(dirpath+'/circuits.pkl', 'wb') as f:
            dill.dump(self.circuits,f)
        with open(dirpath+'/rand_data.pkl', 'wb') as f:
            dill.dump(self.rand_data,f)
        with open(dirpath+'/routines.pkl', 'wb') as f:
            dill.dump(self.routines,f)
    
    def show_attributes(self):
        """Displays which functions/circuit groups have been loaded, and a table for which have been run"""
        atts = ['Qubits','Gates','2Q Count','T Count','t_opt']
        print(f'Circuit attributes:  {atts}')
        if len(self.funcs) == 0: print('No loaded functions')
        else: print(f'Loaded functions:  {list(self.funcs.keys())}')
        if len(self.circuit_groups.keys()) == 0: print('No loaded routines')
        else: print(f'Loaded routines:  {list(self.routines)}')
        if len(self.circuits) == 0:
            print('No circuits added')
            return
        if len(self.circuit_groups) == 0: print('No loaded unsimplified circuit groups')
        else:
            print(f'Loaded circuit groups:  {list(self.circuit_groups.keys())}')
            groups = list(self.circuit_groups.keys())
            strats = ['Original'] + sorted(list(self.funcs.keys())+list(self.routines))
            df = pd.DataFrame(index = groups, columns = strats)
            for g in groups:
                for s in strats:
                    run = '-'
                    for c in self.circuit_groups[g]:
                        if s in self.circuits[c].keys():
                            run = 'Y'
                            break
                    df.at[g, s] = run
            display(df)
        
    def load_circuits(self, dirname: str, group_name: Optional[str] = None, simp_strategy: str ='Original', extension: Optional[str] = None) -> None:
        """Loads circuits from a directory, for either the original circuits or pre-simplified versions

        Args:
            dirname (str): directory in which circuits are located
            group_name (str, optional): the name for the group of circuits being loaded. Defaults to dirname.
            simp_strategy (str, optional): if circuits have been pre-simplified the name of the simplification strategy. Defaults to 'Original'.
            extension (str, optional): extension of circuits in directory. Defaults to None.
        """
        if not group_name: group_name = str(dirname)
        if simp_strategy == 'Original': self.circuit_groups[group_name] = []
        else: self.routines.add(simp_strategy)
        
        for c in [f for f in os.listdir(dirname) if not f.startswith('.')]:
            if not os.path.isfile(os.path.join(dirname,c)): continue
            if not extension or c.find(extension) != -1:
                try:
                    circ = Circuit.load(os.path.join(dirname, c)).to_basic_gates()
                except:
                    print(f'Circuit {c} failed to load')
                    continue
                circ_name = os.path.splitext(c)[0]
                if simp_strategy == 'Original':
                    self.circuit_groups[group_name].append(circ_name)
                if circ_name not in self.circuits.keys(): self.circuits[circ_name] = dict()
                self.circuits[circ_name][simp_strategy] = [circ, circ.qubits, len(circ.gates), circ.twoqubitcount(), circ.tcount(), None]
    
    def add_simplification_func(self, func: Callable[..., Circuit], name: str, groups_to_run: Optional[List[str]] = ['all'], verify=False, rerun = False) -> None:
        """Loads a simplification function

        Args:
            func (Callable[Circuit]): callable function should take a Circuit as an input and output either a Circuit or a tuple (Circuit, t_simp, t_opt)
            name (str): name for the function
            groups_to_run (List[str], optional): groups of circuits to immediately run the function on. Defaults to 'all'.
        """
        self.funcs[name] = func
        if groups_to_run: self.run(funcs_to_run = [name], groups_to_run=groups_to_run, verify=verify, rerun=rerun)
        
    def del_simplification_funcs(self, funcs: List[str]) -> None:
        """Deletes simplification functions

        Args:
            funcs (List[str]): list of simplification function names
        """
        for func_name in funcs:
            if func_name in self.funcs.keys(): del self.funcs[func_name]
            for circuit_name, value in self.circuits.items():
                if func_name in value.keys(): del self.circuits[circuit_name][func_name]
            for parameters, value2 in self.rand_data.items():
                if func_name in value2[1].keys(): # type: ignore
                    del self.rand_data[parameters][1][func_name] # type: ignore
    
    def run(self, funcs_to_run: List[str] = ['all'], groups_to_run: List[str] = ['all'], verify: bool = False, rerun: bool = False) -> None:
        """Runs a series of functions on a series of groups of circuits

        Args:
            funcs_to_run (List[str], optional): names of loaded functions to run. Defaults to 'all'.
            groups_to_run (List[str], optional): names of loaded groups of circuits to run. Defaults to 'all'.
            rerun (bool, optional): rerun circuit even if function has already been run on it. Defaults to False.
        """
        if funcs_to_run == ['all']: funcs_to_run = list(self.funcs.keys())
        if groups_to_run == ['all']: groups_to_run = list(self.circuit_groups.keys())
        for group_name in groups_to_run:
            if group_name not in self.circuit_groups.keys():
                print(f'The group of circuits {group_name} has not been added. Call benchmark.show_attributes() to see loaded group names.')
                continue
            
        groups = [g for gn, g in self.circuit_groups.items() if gn in groups_to_run]
        circuits = [c for g in groups for c in g]
        pbar = tqdm(circuits)
        for circ_name in pbar:
            for func_name in funcs_to_run:
                if func_name not in self.funcs.keys():
                    print(f'The function {func_name} has not been added. Call benchmark.show_attributes() to see loaded functions.')
                    continue
                if func_name in self.circuits[circ_name].keys() and not rerun: continue
                pbar.set_description("{:<70}".format(f'Processing {func_name} on {circ_name}'))
                t0 = perf_counter()
                opt_circ = self.funcs[func_name](self.circuits[circ_name]['Original'][0])
                t_opt = round(perf_counter() - t0,2)
                if verify:
                    c_id = self.circuits[circ_name]['Original'][0].adjoint() # type: ignore
                    c_id.add_circuit(opt_circ)
                    g = c_id.to_graph()
                    zx.simplify.full_reduce(g)
                    if g.num_vertices() != 2*len(g.inputs()):
                        print(f'Circuit resulting from {func_name} on {circ_name} not verified',flush=True)
                        continue
                self.circuits[circ_name][func_name] = [opt_circ, opt_circ.qubits, len(opt_circ.gates), opt_circ.twoqubitcount(), opt_circ.tcount(), t_opt]
    
    @staticmethod
    def generate_cliffordT_circuit(qubits: int, depth: int, p_cnot: float, p_t: float) -> Circuit:
        """Generates a random clifford + T circuit

        Args:
            qubits (int): number of qubits
            depth (int): depth of circuit
            p_cnot (float): probabilitiy of a CNOT gate
            p_t (float): probability of a T gate

        Returns:
            Circuit: Random circuit
        """
        p_s = 0.5*(1.0-p_cnot-p_t)
        p_had = 0.5*(1.0-p_cnot-p_t)
        c = Circuit(qubits)
        for _ in range(depth):
            r = random.random()
            if r > 1-p_had: c.add_gate("HAD",random.randrange(qubits))
            elif r > 1-p_had-p_s: c.add_gate("S",random.randrange(qubits))
            elif r > 1-p_had-p_s-p_t: c.add_gate("T",random.randrange(qubits))
            else:
                tgt = random.randrange(qubits)
                while True:
                    ctrl = random.randrange(qubits)
                    if ctrl!=tgt: break
                c.add_gate("CNOT",tgt,ctrl)
        return c
    
    def generate_data(self, qubits: int, depth: int, cnot_prob: float, t_prob: float, funcs_to_run: List[str] = ['all'], reps: int = 50, overwrite: bool = False, random_seed: Optional[int] = None, pbar: tqdm = None) -> None:
        """Runs a series of functions on randomly generated Clifford + T circuits and stores the average result for each function

        Args:
            qubits (int): number of qubits
            depth (int): depth of circuit
            cnot_prob (float): probaility of a CNOT gate
            t_prob (float): probability of a T gate
            funcs_to_run (List[str], optional): names of loaded functions to run. Defaults to 'all'.
            reps (int, optional): number of repeats for each parameter set. Defaults to 50.
            overwrite (bool, optional): overwrite current data if it exists. Defaults to False.
            random_seed (int, optional): random.random seed. Defaults to None.
            pbar (tqdm, optional): tqdm progress bar. Defaults to None.
        """
        params = f'{qubits}_{depth}_{cnot_prob}_{t_prob}_{reps}'
        if params in self.rand_data.keys() and not overwrite:
            seed = self.rand_data[params][0]
            if random_seed and random_seed != seed:
                seed = random_seed
                self.rand_data[params] = [seed, dict()]
                run = []
            else:
                run = list(self.rand_data[params][1].keys()) # type: ignore
        else:
            if random_seed: seed = random_seed
            else: seed = random.randrange(sys.maxsize)
            self.rand_data[params] = [seed, dict()]
            run = []
        
        random.seed(seed) # type: ignore
        circuits = [self.generate_cliffordT_circuit(qubits, depth, cnot_prob, t_prob) for _ in range(reps)]
        
        if 'Original' not in run:
            count = [0, 0, 0]
            for c in circuits:
                count[0] += len(c.gates)
                count[1] += c.twoqubitcount()
                count[2] += c.tcount()
            count = [x/reps for x in count] # type: ignore
            self.rand_data[params][1]['Original'] = count      # type: ignore
            
        if funcs_to_run == ['all']: funcs_to_run = self.funcs.keys()   # type: ignore     
        for func_name in funcs_to_run:
            if func_name not in self.funcs.keys():
                print(f'The function {func_name} has not been added. Call benchmark.show_attributes() to see loaded functions.')
                continue
            if func_name in run and not overwrite: continue
            
            if pbar: pbar.set_description("{:<50}".format(f'Processing {func_name} on P_t = {t_prob}'))
            count = [0, 0, 0]
            for c in circuits:
                c = self.generate_cliffordT_circuit(qubits, depth, cnot_prob, t_prob)
                res = self.funcs[func_name](c)
                if not isinstance(res, tuple): c2 = res
                else: c2 = res[0]
                count[0] += len(c2.gates)
                count[1] += c2.twoqubitcount()
                count[2] += c2.tcount()
            count = [x/reps for x in count] # type: ignore
            self.rand_data[params][1][func_name] = count # type: ignore
    
    def Pt_graphs(self, funcs: List[str], qubits: int, depth: int, cnot_prob: float, t_probs: List[float], ys: List[str] = ['Gates','2Q Count','T Count'], reps: int = 50, overwrite: bool = False, figsize: List[int] = [7,5], random_seed: Optional[int] = None) -> plt.figure:
        """Produces a series of graphs for circuit simplification metrics for random circuits with a range of T gate probabilites

        Args:
            funcs (List[str]): names of loaded functions to display on graphs
            qubits (int): number of qubits
            depth (int): depth of circuits
            cnot_prob (float): probability of CNOT gates
            t_probs (List[float]): range of T gate probabilites
            ys (List[str], optional): which metrics to print out. Defaults to ['Gates','2Q Count','T Count']. Options limited to subsets of this set.
            reps (int, optional): number of repeats for each parameter set. Defaults to 50.
            overwrite (bool, optional): overwrite current data if it exists. Defaults to False.
            figsize (List[int, int], optional): figure size for each plot. Defaults to [7,5].
            random_seed (int, optional): random.random seed. Defaults to None.

        Returns:
            plt.figure: matplotlib.pyplot figure with a subplot for each metric in ys
        """
        for func_name in funcs[:]:
            if func_name not in self.funcs.keys():
                print(f'The function {func_name} has not been added. Call benchmark.show_attributes() to see loaded functions.')
                funcs.remove(func_name)
                
        g_count = np.empty((len(funcs)+1, 0)).tolist()
        two_count = np.empty((len(funcs)+1, 0)).tolist()
        t_count = np.empty((len(funcs)+1, 0)).tolist()
        
        pbar = tqdm(t_probs)
        for t_prob in pbar:
            self.generate_data(qubits, depth, cnot_prob, t_prob, funcs_to_run=funcs, reps=reps, overwrite=overwrite, random_seed=random_seed, pbar=pbar)
            params = f'{qubits}_{depth}_{cnot_prob}_{t_prob}_{reps}'
            for i,func_name in enumerate(['Original']+funcs):
                count = self.rand_data[params][1][func_name] # type: ignore
                g_count[i].append(count[0])
                two_count[i].append(count[1])
                t_count[i].append(count[2])
        
        stats = [y for y in ys if y in ['Gates','2Q Count','T Count']]
        fs = figsize[:]
        fs[0] *= len(stats)
        fig = plt.figure(figsize=fs)
        
        if 'Gates' in stats: 
            ax1 = fig.add_subplot(1,len(stats),stats.index('Gates')+1)
            ax1.set_ylabel("Total Gate Count")
            ax1.set_xlabel("$P_t$")
            ax1.grid(color='#EEEEEE')
        if '2Q Count' in stats:
            ax2 = fig.add_subplot(1, len(stats),stats.index('2Q Count')+1)
            ax2.set_ylabel("2-Qubit Gate Count")
            ax2.set_xlabel("$P_t$")
            ax2.grid(color='#EEEEEE')
        if 'T Count' in stats:
            ax3 = fig.add_subplot(1, len(stats),stats.index('T Count')+1)
            ax3.set_ylabel("T Gate Count")
            ax3.set_xlabel("$P_t$")
            ax3.grid(color='#EEEEEE')
        
        for i, func_name in enumerate(['Originial']+funcs):
            if 'Gates' in stats: ax1.plot(t_probs, g_count[i], marker="o" ,markersize=3, linestyle=':', label=func_name)
            if '2Q Count' in stats: ax2.plot(t_probs, two_count[i], marker="o" ,markersize=3, linestyle=':', label=func_name)
            if 'T Count' in stats: ax3.plot(t_probs, t_count[i], marker="o" ,markersize=3, linestyle=':', label=func_name)
        
        plt.legend(bbox_to_anchor=(0.11, -0.19), loc="lower left",
                bbox_transform=fig.transFigure, ncol=3*len(stats), fancybox=True)
        return fig 
    
    @staticmethod
    def table_style(styler: plt.style , cols: List[Tuple[str]]) -> plt.style:
        styler.set_properties(**{'width':'8ch', 'text-align':'center'}).set_table_styles([dict(selector="th.col_heading.level1",props=[('text-align', 'center')])])
        styler.set_table_styles([{'selector': 'tr:hover', 'props': [('background-color', '#e1f7d5'),('color', 'black'),('font-weight', 'bold')]}, #cell_hover
                                {'selector': '.index_name', 'props': 'background-color: #232b2b; font-style: italic; color: white; font-weight:bold;'}, #index_names
                                {'selector': 'th:not(.index_name)', 'props': 'background-color: #232b2b; color: white;'}, #headers
                                {'selector': 'th.col_heading.level0', 'props': 'text-align: center; font-size: 1.2em; padding: 0.7em'},
                                {'selector': 'td', 'props': 'text-align: center; font-size: 1em'}], overwrite=False)
        if any('Gates' in col for col in cols): border_col = 'Gates'
        elif any('2Q Count' in col for col in cols): border_col = '2Q Count'
        elif any('T Count' in col for col in cols): border_col = 'T Count'
        elif any('t_opt' in col for col in cols): border_col = 't_opt'
        styler.set_table_styles(dict.fromkeys([col for col in cols if border_col in col or ('Original' in col and 'Qubits' in col)], [{'selector': 'th', 'props': 'border-left: 1px solid white !important'},
                                                                                        {'selector': 'td', 'props': 'border-left: 1px solid white !important'}]), overwrite=False, axis=0)
        styler.apply(lambda s: np.where(s==np.nanmin(s.values),'color:green',''), axis=1, subset=[col for col in cols if 'Gates' in col])
        styler.apply(lambda s: np.where(s==np.nanmin(s.values),'color:green',''), axis=1, subset=[col for col in cols if '2Q Count' in col])  
        styler.apply(lambda s: np.where(s==np.nanmin(s.values),'color:green',''), axis=1, subset=[col for col in cols if 'T Count' in col])
        styler.format(subset=[col for col in cols if 't_opt' in col],precision=2, na_rep='-', thousands=",")
        styler.format(subset=[col for col in cols if 't_opt' not in col],precision=0, na_rep='-', thousands=",")
        return(styler)
                
    def df(self, groups: List[str] = ['all'], routines: List[str] = ['all'], funcs: List[str] = ['all'], atts: List[str] = ['all']) -> pd.DataFrame:
        """Produces a pandas dataframe of metrics over benchmark circuits.

        Args:
            groups (List[str], optional): group names for circuits for index. Defaults to 'all'.
            routines (List[str], optional): names for routines for columns. Defaults to 'all'.
            funcs (List[str], optional): names for functions for columns. Defaults to 'all'.
            atts (List[str], optional): names for attributes to show for each function/routine. Defaults to 'all'.

        Returns: pd.DataFrame
        """
        if groups==['all']: groups=list(self.circuit_groups.keys())
        if routines==['all']: routines=sorted(list(self.routines))
        else:
            for r in routines[:]:
                if r not in self.routines:
                    print(f'The routine {r} has not been added. Call <benchmark>.show_attributes() to see loaded routines.')
                    routines.remove(r)
        if funcs==['all']: funcs=sorted(list(self.funcs))
        else:
            for f in funcs[:]:
                if f not in self.funcs.keys():
                    print(f'The function {f} has not been added. Call <benchmark>.show_attributes() to see loaded functions.')
                    funcs.remove(f)
        
        all_atts = ['Qubits','Gates','2Q Count','T Count','t_opt','na']
        if atts == ['all']: atts = all_atts
        match_atts = [True if att in atts else False for att in all_atts]
        
        heads = ['Original'] + routines + funcs
        circs = []
        data = []
        for g in groups:
            if g not in self.circuit_groups.keys():
                print(f'The group of circuits {g} has not been added. Call <benchmark>.show_attributes() to see loaded groups.')
                continue
            for c in self.circuit_groups[g]:
                c_data = []
                for f in heads:
                    try: d = self.circuits[c][f][1:]
                    except: d = [np.nan]*6
                    c_data.extend([x for i,x in enumerate(d) if match_atts[i]])
                circs.append(c)
                data.append(c_data)
        
        df = pd.DataFrame(data=data, columns=pd.MultiIndex.from_product([heads,atts]))
        df['Circuits'] = circs
        df = df.set_index('Circuits')
        df = df.sort_index()
        df=df[[col for col in df.columns if 'Qubits' not in col or 'Original' in col]]
        df=df.dropna(axis=1, how='all')
        display(df.style.pipe(self.table_style, cols=df.columns))
        return df        