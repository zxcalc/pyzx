// Initial wiring: [2, 7, 6, 8, 4, 0, 1, 3, 5]
// Resulting wiring: [2, 7, 6, 8, 4, 0, 1, 3, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[7];
cx q[3], q[8];
cx q[7], q[6];
