// Initial wiring: [0, 7, 1, 2, 8, 5, 6, 3, 4]
// Resulting wiring: [0, 7, 1, 2, 8, 5, 6, 3, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[0], q[5];
cx q[6], q[5];
