// Initial wiring: [6, 1, 3, 8, 4, 7, 0, 2, 5]
// Resulting wiring: [6, 1, 3, 8, 4, 7, 0, 2, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[1];
cx q[3], q[5];
cx q[3], q[4];
