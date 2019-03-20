// Initial wiring: [2, 1, 4, 0, 6, 8, 3, 5, 7]
// Resulting wiring: [2, 1, 4, 0, 6, 8, 3, 5, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[7];
cx q[8], q[7];
cx q[6], q[5];
