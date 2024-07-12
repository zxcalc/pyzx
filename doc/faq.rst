Frequently Asked Questions
=============================

.. _faq:


Most of these questions actually aren't asked that frequently, but I figured this would be a good place to put all this information.


What is the ZX-calculus? What are ZX-diagrams?
-----------------------------------------------

ZX-diagrams are a graphical representation of quantum processes. For those who know what that means: they are a type of tensor network.
The benefit of using ZX-diagrams over quantum circuits is that, first, ZX-diagrams can represent arbitrary linear maps and not just unitaries, and second, it comes equipped with a set of useful rewrite rules. These rewrite rules are collectively known as the *ZX-calculus*.
If you want to learn more, check out the `Wikipedia page <https://en.wikipedia.org/wiki/ZX-calculus>`_, this `review article <https://arxiv.org/abs/2012.13966>`_, or `this book <https://www.amazon.com/Picturing-Quantum-Processes-Diagrammatic-Reasoning/dp/110710422X>`_.


But why use the ZX-calculus?
--------------------------------

Quantum circuits are very 'rigid'. They have the same number of input and output wires, and gates occur at specific locations on these wires. ZX-diagrams are more flexible, which allows us to find (in principle) more optimisations. Since we are not restricted to unitary circuits, we can also use ZX-diagrams to reason about non-unitary models of computation like 
`Measurement-based Quantum Computation <https://arxiv.org/abs/2003.01664>`_ or `lattice surgery in surface codes <https://arxiv.org/abs/1704.08670>`_.
There are some issues when doing this rewriting though, which is that it can be `hard <https://arxiv.org/abs/2202.09194>`_ to transform a ZX-diagram back into a quantum circuit. You can still do this however, if you are `smart <https://arxiv.org/abs/1902.03178>`_ about it.


So what has been done with the ZX-calculus?
-----------------------------------------------

A bunch of things! Below I list just the things related to quantum computing where there are concrete numbers to back-up the benefits of using it over standard quantum circuits.

- Using the rewrite strategy :func:`~pyzx.simplify.full_reduce` that is implemented in PyZX, a Clifford circuit can be brought into a `normal form <https://arxiv.org/abs/1902.03178>`_ that has some nice properties.
- Using this same rewrite strategy, all the Clifford measurements in a measurement-based quantum computation can be `removed <https://arxiv.org/abs/2003.01664>`_.
- Using this same rewrite strategy, we can optimise the `T-count <https://arxiv.org/abs/1903.10477>`_ of a circuit.
- Using ZX-diagrams, `several <https://arxiv.org/abs/1812.01238>`_ surface code `constructions <https://arxiv.org/abs/1905.08916>`_ have `succesfully <https://arxiv.org/abs/1912.11503>`_ been `optimised <https://arxiv.org/abs/2206.12780>`_.
- Using ZX-diagrams, the simulation technique of `stabilizer decompositions <https://quantum-journal.org/papers/q-2019-09-02-181/>`_ can be `interleaved with diagrammatic simplifications <https://arxiv.org/abs/2109.01076>`_ to speed these up by a `considerable amount <https://arxiv.org/abs/2202.09202>`_. These techniques are implemented in a Rust port of PyZX: `quizx <https://github.com/zxcalc/quizx>`_.



Where do I go to ask questions about PyZX and the ZX-calculus?
------------------------------------------------------------------

Check out the `ZX-calculus Discord channel <https://discord.gg/6shbsEQ3FC>`_. Otherwise you could go to the `Quantum Computing Stack Exchange <https://quantumcomputing.stackexchange.com/>`_ and tag your question with ``zx-calculus``. If you have a feature request or something you think might be a bug, feel free to create an `issue on Github <https://github.com/zxcalc/pyzx/issues>`_.



I don't like Python. Can I do ZX-calculus things in different languages?
------------------------------------------------------------------------------

Some of the functionality of PyZX has been ported to the `ZXCalculus.jl <https://juliapackages.com/p/zxcalculus>`_ Julia package. A port to the Rust language, `quizx <https://github.com/zxcalc/quizx>`_, is also available. These packages have the benefit of being a lot faster, but the drawback of been less feature-rich, for instance having less capabilities of visualising the results.


What are some things people have done with PyZX?
-----------------------------------------------------

Below there is a list of papers where the authors either contributed new features to PyZX, or otherwise used PyZX in their work (for instance to optimise circuits they use, or to benchmark against). I try to keep this list up-to-date. If you see something missing, let me know!
You might also want to take a look at the full list of `ZX papers tagged PyZX <https://zxcalculus.com/publications.html?q=pyzx>`_ (although this does not include papers that do not use ZX-diagrams themselves).

Implemented additional features:

- `Meijer-van de Griendt <https://arxiv.org/abs/1904.00633>`_ implemented a CNOT routing algorithm in PyZX based on Steiner trees.
- `East et al. <https://arxiv.org/abs/2012.01219>`_ built on the ZH-calculus rewrite strategy in PyZX to automatically simplify AKLT states. See also `Richard East's PhD thesis <https://tel.archives-ouvertes.fr/tel-03719945>`_.
- Ryan Krueger in `his Master thesis <https://arxiv.org/abs/2209.06874>`_ looked at using simulated annealing and genetic algorithms to improve simplification and reduce CNOT count of the resulting circuits. Related strategies were proposed in `Korbinian Staudacher's Master thesis <https://www.mnm-team.org/pub/Diplomarbeiten/stau21/PDF-Version/stau21.pdf>`_.
- `Borgna et al. <https://arxiv.org/abs/2109.06071>`_ implemented mixed quantum-classical optimization in PyZX. This allows you to represent and simplify circuits that include measurement and classical control.


Used PyZX:

- `Lehmann et al. <https://arxiv.org/abs/2205.05781>`_ implemented some ZX-calculus rewrite rules in `Coq <https://coq.inria.fr/>`_ in order to formally verify correctness of rewrite rules.
- `Hanks et al. <https://journals.aps.org/prx/abstract/10.1103/PhysRevX.10.041030>`_ used the ZX-calculus to optimise braided circuits on surface codes. PyZX helped them optimise the circuits to a size where they could do further optimisation by hand.
- `Neri et al. <https://ieeexplore.ieee.org/abstract/document/9557827?casa_token=PNUnIAHVfVcAAAAA:Wc1S-lri0k1jQxRHWVKln_zoq0johTznpzMH8FQrpyCxf27VaTOKyYoCOB9-dDsBO74A8b4Z2Q>`_ used PyZX in their pipeline to compile quantum circuits to something that could run on physical quantum computers.

Benchmarked against PyZX:

- `Yeh et al. <https://src.acm.org/binaries/content/assets/src/2020/lia-yeh.pdf>`_ benchmarked PyZX against Qiskit transpilation and finds that in some cases PyZX improves gate counts beyond that of Qiskit.
- `Hietala et al. <https://arxiv.org/abs/1912.02250>`_ implemented a verified quantum compiler, also in Coq, and benchmarked it against PyZX (amongst other libraries). They find that while PyZX is better at T-count optimisation, it is worse at reducing two-qubit gate count.
- `Kharkov et al. <https://arxiv.org/abs/2202.14025>`_ built a general compiler benchmark platform and compared various compilers on a variety of different metrics.


What is PyZX not good at?
-------------------------------

PyZX was originally built to optimize T-count. It is not so good at optimizing two-qubit gate count (like the number of CNOTs). This behaviour however changes quite drastically per type of circuit. You might find for instance that it blows up the number of CNOTs if you start with a circuit full of Toffoli's, while if you give it a Trotterized chemistry circuit, it will be able to perform a lot better.

PyZX also doesn't implement any of the tricks to optimally compile one and two-qubit circuits, such as using the Euler Decomposition to combine adjacent single-qubit rotations, or the KAK decomposition to reduce every two-qubit circuit to have at most three CNOTs.

PyZX is quite fast, but it is still written in Python, and as such has its limits. If you have a circuit with tens of thousands of gates it should run quickly enough, but if you go to millions of gates, it will start to lag. If speed is your concern, check out `quizx <https://github.com/zxcalc/quizx>`_.
