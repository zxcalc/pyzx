// Initial wiring: [6, 1, 8, 0, 4, 2, 3, 7, 5]
// Resulting wiring: [6, 1, 8, 0, 4, 2, 3, 7, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[3], q[4];
cx q[4], q[5];
cx q[4], q[7];
