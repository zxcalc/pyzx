// Initial wiring: [2, 4, 5, 1, 6, 8, 7, 0, 3]
// Resulting wiring: [2, 4, 5, 1, 6, 8, 7, 0, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[2];
cx q[4], q[7];
cx q[3], q[8];
