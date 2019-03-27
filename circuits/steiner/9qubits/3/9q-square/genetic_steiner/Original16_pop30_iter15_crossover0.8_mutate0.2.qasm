// Initial wiring: [2, 0, 6, 3, 4, 1, 8, 7, 5]
// Resulting wiring: [2, 0, 6, 3, 4, 1, 8, 7, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[6];
cx q[8], q[3];
cx q[0], q[5];
