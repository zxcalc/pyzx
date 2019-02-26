// Initial wiring: [0, 6, 7, 2, 1, 8, 4, 5, 3]
// Resulting wiring: [0, 6, 7, 2, 1, 8, 4, 5, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[1], q[4];
cx q[7], q[4];
