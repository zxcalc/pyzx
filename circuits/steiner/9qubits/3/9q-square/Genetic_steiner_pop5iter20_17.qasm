// Initial wiring: [3, 2, 4, 1, 0, 8, 6, 7, 5]
// Resulting wiring: [3, 2, 4, 1, 0, 8, 6, 7, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[8], q[7];
cx q[2], q[1];
