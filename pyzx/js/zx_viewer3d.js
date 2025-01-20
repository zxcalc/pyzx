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

    const buttons = document.createElement('div');
    buttons.style.textAlign = 'center';
    buttons.style.fontSize = '2em';
    buttons.style.width = width + 'px';
    element.appendChild(buttons);

    const leftButton = document.createElement('a');
    leftButton.href = '#';
    leftButton.innerHTML = '&#129092;';
    buttons.appendChild(leftButton);

    const rightButton = document.createElement('a');
    rightButton.href = '#';
    rightButton.innerHTML = '&#129094;';
    buttons.appendChild(rightButton);

    const controls = new OrbitControls( camera, labelRenderer.domElement );
    const raycaster = new THREE.Raycaster();
    const mouse = new THREE.Vector2();
    let highlightRow = -1;
    controls.minDistance = 1;
    controls.maxDistance = 100;


    var ntab = {};

    const rows = new Set();
    let minY = null, maxY = null, minZ = null, maxZ = null;

    graph.nodes.forEach(function(d) {
        ntab[d.name] = d;
        d.nhd = [];
        rows.add(d.x);
        minY = (minY == null) ? d.y : Math.min(d.y, minY);
        minZ = (minZ == null) ? d.z : Math.min(d.z, minZ);
        maxY = (maxY == null) ? d.y : Math.max(d.y, maxY);
        maxZ = (maxZ == null) ? d.z : Math.max(d.z, maxZ);

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
        d.sphere.renderOrder = 0.0;
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

    const rowList = [...rows].sort((a,b) => a-b);
    console.log(rowList);

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
        d.line.renderOrder = 0.5;
        scene.add(d.line);
    });

    const highlightPlane = new THREE.Mesh(
        new THREE.PlaneGeometry(maxZ - minZ + 0.5, maxY - minY + 0.5),
        new THREE.MeshLambertMaterial({color: 0xddddff, side: THREE.DoubleSide, transparent: true}));
    highlightPlane.rotation.set(0,0.5*Math.PI,0);
    highlightPlane.position.set(0,(minY+maxY)/2, (minZ+maxZ)/2);
    highlightPlane.material.opacity = 0.0;
    highlightPlane.renderOrder = 1.0;
    scene.add(highlightPlane);

    function checkIntersection() {
        raycaster.setFromCamera(mouse, camera);
        const intersects = raycaster.intersectObject(scene, true);
        if (intersects.length > 0) {
            const selectedObject = intersects[0].object;
            if (Object.hasOwn(selectedObject, 'name') && selectedObject.name != '') {
                const d = ntab[selectedObject.name];
                highlightRow = rowList.indexOf(d.x);
            } else {
                highlightRow = -1;
            }
        } else {
            highlightRow = -1;
        }

        update();
    }

    function update() {
        if (highlightRow == -1) {
            highlightPlane.material.opacity = 0.0;
        } else {
            highlightPlane.position.setComponent(0, rowList[highlightRow]);
            highlightPlane.material.opacity = 0.5;
        }

        graph.nodes.forEach(function (d) {
            if (highlightRow == -1 || rowList[highlightRow] == d.x) {
                d.sphere.material.opacity = 1.0;
            } else {
                d.sphere.material.opacity = 0.4;
            }
        });

        graph.links.forEach(function (d) {
            if (highlightRow == -1 || (rowList[highlightRow] == d.target.x && rowList[highlightRow] == d.source.x)) {
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

    function goLeft() {
        if (rowList.length > 0) {
            if (highlightRow == -1) {
                highlightRow = rowList.length - 1;
            } else {
                if (highlightRow == 0) {
                    highlightRow = rowList.length - 1;
                } else {
                    highlightRow = highlightRow - 1;
                }
            }
        }
        update();
    }

    function goRight() {
        if (rowList.length > 0) {
            if (highlightRow == -1) {
                highlightRow = 0;
            } else {
                highlightRow = (highlightRow + 1) % rowList.length;
            }
        }
        update();
    }

    labelRenderer.domElement.addEventListener('mousedown', onMouseDown);
    labelRenderer.domElement.addEventListener('mouseup', onMouseUp);
    leftButton.addEventListener('click', goLeft);
    rightButton.addEventListener('click', goRight);
    labelRenderer.tabIndex = 0;

    function animate() {
        renderer.render(scene, camera);
        labelRenderer.render(scene, camera);
    }
    renderer.setAnimationLoop(animate);
}