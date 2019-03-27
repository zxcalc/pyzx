// Initial wiring: [4, 5, 7, 3, 2, 1, 6, 8, 0]
// Resulting wiring: [4, 5, 7, 3, 2, 1, 6, 8, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[1];
cx q[8], q[7];
cx q[6], q[7];
cx q[4], q[5];
cx q[3], q[4];
