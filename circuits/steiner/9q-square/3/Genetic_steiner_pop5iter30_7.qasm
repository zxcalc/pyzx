// Initial wiring: [4, 2, 3, 5, 7, 1, 8, 6, 0]
// Resulting wiring: [4, 2, 3, 5, 7, 1, 8, 6, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[3], q[4];
cx q[8], q[7];
