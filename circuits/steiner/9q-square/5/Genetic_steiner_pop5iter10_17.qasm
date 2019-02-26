// Initial wiring: [3, 1, 5, 7, 8, 2, 6, 4, 0]
// Resulting wiring: [3, 1, 5, 7, 8, 2, 6, 4, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[0], q[1];
cx q[3], q[8];
cx q[8], q[7];
