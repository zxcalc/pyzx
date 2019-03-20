// Initial wiring: [6, 8, 2, 7, 3, 0, 5, 1, 4]
// Resulting wiring: [6, 8, 2, 7, 3, 0, 5, 1, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[5];
cx q[7], q[6];
cx q[7], q[4];
