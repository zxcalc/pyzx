// Initial wiring: [0, 8, 2, 5, 4, 6, 1, 3, 7]
// Resulting wiring: [0, 8, 2, 5, 4, 6, 1, 3, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[1], q[2];
cx q[5], q[6];
cx q[4], q[5];
cx q[4], q[3];
