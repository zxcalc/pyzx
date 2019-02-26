// Initial wiring: [1, 5, 8, 6, 4, 3, 0, 2, 7]
// Resulting wiring: [1, 5, 8, 6, 4, 3, 0, 2, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[2], q[1];
cx q[5], q[0];
