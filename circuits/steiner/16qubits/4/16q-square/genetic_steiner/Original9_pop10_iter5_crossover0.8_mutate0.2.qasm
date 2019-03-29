// Initial wiring: [10, 15, 4, 1, 13, 7, 0, 12, 9, 8, 5, 6, 3, 14, 2, 11]
// Resulting wiring: [10, 15, 4, 1, 13, 7, 0, 12, 9, 8, 5, 6, 3, 14, 2, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[7], q[6];
cx q[6], q[5];
cx q[7], q[6];
cx q[15], q[14];
cx q[14], q[9];
cx q[4], q[11];
