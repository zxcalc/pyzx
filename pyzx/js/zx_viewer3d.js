// PyZX - Python library for quantum circuit rewriting 
//        and optimisation using the ZX-calculus
// Copyright (C) 2025 - Aleks Kissinger and John van de Wetering

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//    http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import * as THREE from 'three';
import { Line2 } from 'three/addons/lines/Line2.js';
import { LineGeometry } from 'three/addons/lines/LineGeometry.js';
import { LineMaterial } from 'three/addons/lines/LineMaterial.js';
import { OrbitControls } from 'three/addons/controls/OrbitControls.js';
import { CSS2DRenderer, CSS2DObject } from 'three/addons/renderers/CSS2DRenderer.js';

export function showGraph3D(tag, graph, width, height, show_labels) {
    const scene = new THREE.Scene();
    scene.background = new THREE.Color(0xffffff);
    const aspect = height/width;
    const camera = new THREE.OrthographicCamera(-20, 20, 20*aspect, -20*aspect);
    camera.layers.enableAll();
    const renderer = new THREE.WebGLRenderer({ antialias: true });
    renderer.setSize(width, height);
    const labelRenderer = new CSS2DRenderer();
    labelRenderer.setSize(width, height);
    labelRenderer.domElement.style.position = 'absolute';
    labelRenderer.domElement.style.top = '0px';
    const element = document.getElementById(tag);
    element.appendChild(renderer.domElement);
    element.appendChild(labelRenderer.domElement);
    const controls = new OrbitControls( camera, labelRenderer.domElement );
    controls.minDistance = 1;
    controls.maxDistance = 100;
    controls.enablePan = false;
    scene.add(new THREE.AmbientLight(0xffffff, 1.5));
    const light = new THREE.DirectionalLight( 0xffffff, 2);
    light.position.set(1, 1, 1).normalize();
    scene.add(light);
    camera.position.z = 10;

    var ntab = {};

    graph.nodes.forEach(function(d) {
        ntab[d.name] = d;
        d.nhd = [];

        let color = 0x000000, radius = 0.1;
        if (d.t == 1) {
            color = Number('0x' + '#99dd99'.substring(1));
            radius = 0.2;
        } else if (d.t == 2) {
            color = Number('0x' + '#ff8888'.substring(1));
            radius = 0.2;
        }

        const geometry = new THREE.SphereGeometry(radius, 48, 24);
        const material = new THREE.MeshLambertMaterial({ color: color });
        const sphere = new THREE.Mesh(geometry, material);
        sphere.position.set(d.x, d.y, d.z);
        sphere.layers.enableAll();
        scene.add(sphere);

        if (d.phase != '') {
            const phaseDiv = document.createElement('div');
            phaseDiv.className = 'label';
            phaseDiv.textContent = d.phase;
            phaseDiv.style.backgroundColor = 'transparent';
            phaseDiv.style.textAlign = 'center';
            phaseDiv.style.color = '#0000ff';
            const phaseLabel = new CSS2DObject(phaseDiv);
            phaseLabel.position.set(0.25, 0.5);
            phaseLabel.center.set(0, 0);
            sphere.add(phaseLabel);
            phaseLabel.layers.set(1);
        }

    });

    graph.links.forEach(function(d) {
        var s = ntab[d.source];
        var t = ntab[d.target];
        // d.source = s;
        // d.target = t;
        // s.nhd.push(t);
        // t.nhd.push(s);
        let color = 0x000000;
        if (s.x != t.x) {
            color = 0x999999;
        }

        const material = new LineMaterial({ color: color, linewidth: 2 });
        const geometry = new LineGeometry().setFromPoints([
            new THREE.Vector3(s.x, s.y, s.z),
            new THREE.Vector3(t.x, t.y, t.z)
        ]);
        const line = new Line2(geometry, material);
        scene.add(line);
    });

    function animate() {
        renderer.render(scene, camera);
        labelRenderer.render(scene, camera);
    }
    renderer.setAnimationLoop(animate);
}