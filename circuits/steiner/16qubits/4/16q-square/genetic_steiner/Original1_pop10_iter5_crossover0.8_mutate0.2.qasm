// Initial wiring: [13, 14, 6, 10, 12, 1, 11, 3, 7, 5, 2, 15, 4, 0, 9, 8]
// Resulting wiring: [13, 14, 6, 10, 12, 1, 11, 3, 7, 5, 2, 15, 4, 0, 9, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[8], q[7];
cx q[9], q[6];
cx q[6], q[5];
cx q[9], q[6];
cx q[8], q[9];
cx q[0], q[1];
