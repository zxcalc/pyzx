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
    const aspect = height/width;
    const scale = 20;
    const camera = new THREE.OrthographicCamera(-scale, scale, scale*aspect, -scale*aspect);
    const renderer = new THREE.WebGLRenderer({ antialias: true });
    const labelRenderer = new CSS2DRenderer();
    const light = new THREE.DirectionalLight( 0xffffff, 2);

    scene.background = new THREE.Color(0xffffff);
    camera.layers.enableAll();
    scene.add(new THREE.AmbientLight(0xffffff, 1.5));
    light.position.set(1, 1, 1).normalize();
    scene.add(light);
    camera.position.z = 10;
    renderer.setSize(width, height);
    labelRenderer.setSize(width, height);
    labelRenderer.domElement.style.position = 'absolute';
    labelRenderer.domElement.style.top = '0px';

    const element = document.getElementById(tag);
    element.appendChild(renderer.domElement);
    element.appendChild(labelRenderer.domElement);

    const controls = new OrbitControls( camera, labelRenderer.domElement );
    const raycaster = new THREE.Raycaster();
    const mouse = new THREE.Vector2();
    let highlightRow = null;
    controls.minDistance = 1;
    controls.maxDistance = 100;


    var ntab = {};

    const spheres = [];
    const lines = [];
    const rows = new Set();

    graph.nodes.forEach(function(d) {
        ntab[d.name] = d;
        d.nhd = [];
        rows.add(d.x);

        let color = 0x000000, radius = 0.1;
        if (d.t == 1) {
            color = Number('0x' + '#99dd99'.substring(1));
            radius = 0.15;
        } else if (d.t == 2) {
            color = Number('0x' + '#ff8888'.substring(1));
            radius = 0.15;
        }

        const geometry = new THREE.SphereGeometry(radius, 48, 24);
        const material = new THREE.MeshLambertMaterial({ color: color, transparent: true });
        d.sphere = new THREE.Mesh(geometry, material);
        d.sphere.name = d.name;
        d.sphere.position.set(d.x, d.y, d.z);
        d.sphere.layers.enableAll();
        scene.add(d.sphere);

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
            d.sphere.add(phaseLabel);
            phaseLabel.layers.set(1);
        }

    });

    const rowList = [...rows].sort();

    graph.links.forEach(function(d) {
        var s = ntab[d.source];
        var t = ntab[d.target];
        d.source = s;
        d.target = t;
        s.nhd.push(t);
        t.nhd.push(s);
        let color = 0x000000;
        if (d.t == 2) {
            color = 0xffff66;
        }

        const material = new LineMaterial({ color: color, linewidth: 2, transparent: true });
        if (s.x != t.x) { material.opacity = 0.5; }
        const geometry = new LineGeometry().setFromPoints([
            new THREE.Vector3(s.x, s.y, s.z),
            new THREE.Vector3(t.x, t.y, t.z)
        ]);
        d.line = new Line2(geometry, material);
        scene.add(d.line);
    });

    function checkIntersection() {
        raycaster.setFromCamera(mouse, camera);
        const intersects = raycaster.intersectObject(scene, true);
        if (intersects.length > 0) {
            const selectedObject = intersects[0].object;
            if (Object.hasOwn(selectedObject, 'name') && selectedObject.name != '') {
                const d = ntab[selectedObject.name];
                highlightRow = d.x;
            } else {
                highlightRow = null;
            }
        } else {
            highlightRow = null;
        }

        update();
    }

    function update() {
        graph.nodes.forEach(function (d) {
            if (highlightRow == null || d.x == highlightRow) {
                d.sphere.material.opacity = 1.0;
            } else {
                d.sphere.material.opacity = 0.4;
            }
        });

        graph.links.forEach(function (d) {
            if (highlightRow == null || (d.source.x == highlightRow && d.target.x == highlightRow)) {
                if (d.source.x != d.target.x) {
                    d.line.material.opacity = 0.5;
                } else {
                    d.line.material.opacity = 1.0;
                }
            } else {
                d.line.material.opacity = 0.25;
            }
        });
    }

    let mouseX = 0;
    let mouseY = 0;

    function onMouseDown(event) {
        mouseX = event.clientX;
        mouseY = event.clientY;
    }
    
    function onMouseUp(event) {
        if (event.isPrimary === false) return;
        const dx = event.clientX - mouseX;
        const dy = event.clientY - mouseY;

        if (dx == 0 && dy == 0) {
            const rect = element.getBoundingClientRect();
            const x = event.clientX - rect.left;
            const y = event.clientY - rect.top;

            mouse.x = ((x / width) * 2 - 1);
            mouse.y = (-(y / height) * 2 + 1);
            checkIntersection();
        }
    }

    function onKeyDown(event) {
        switch (event.key) {
            case "ArrowLeft":
                if (highlightRow == null || highlightRow == 0) {
                    highlightRow = 0;
                } else {
                    highlightRow -= 1;
                }
                update();
                break;
            case "ArrowRight":
                if (highlightRow == null) {
                    highlightRow = 0;
                } else {
                    highlightRow += 1;
                }
                update();
                break;
        }
    }

    labelRenderer.domElement.addEventListener('mousedown', onMouseDown);
    labelRenderer.domElement.addEventListener('mouseup', onMouseUp);
    labelRenderer.domElement.addEventListener('keydown', onKeyDown);

    function animate() {
        renderer.render(scene, camera);
        labelRenderer.render(scene, camera);
    }
    renderer.setAnimationLoop(animate);
}