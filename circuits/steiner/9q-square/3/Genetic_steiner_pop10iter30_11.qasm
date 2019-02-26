// Initial wiring: [3, 8, 2, 7, 6, 0, 1, 4, 5]
// Resulting wiring: [3, 8, 2, 7, 6, 0, 1, 4, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[4], q[5];
cx q[5], q[0];
cx q[4], q[5];
