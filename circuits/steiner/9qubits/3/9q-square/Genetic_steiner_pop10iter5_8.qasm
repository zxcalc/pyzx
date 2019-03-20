// Initial wiring: [4, 6, 1, 0, 7, 2, 5, 3, 8]
// Resulting wiring: [4, 6, 1, 0, 7, 2, 5, 3, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[5], q[6];
cx q[0], q[5];
cx q[5], q[6];
