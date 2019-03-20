// Initial wiring: [2, 4, 0, 3, 6, 7, 5, 1, 8]
// Resulting wiring: [2, 4, 0, 3, 6, 7, 5, 1, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[5], q[6];
cx q[4], q[5];
cx q[3], q[8];
