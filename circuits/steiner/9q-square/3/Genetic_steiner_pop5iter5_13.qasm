// Initial wiring: [2, 0, 7, 8, 6, 1, 3, 5, 4]
// Resulting wiring: [2, 0, 7, 8, 6, 1, 3, 5, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[5];
cx q[3], q[8];
cx q[3], q[2];
