// Initial wiring: [5, 15, 4, 1, 13, 3, 11, 8, 0, 7, 14, 12, 9, 2, 10, 6]
// Resulting wiring: [5, 15, 4, 1, 13, 3, 11, 8, 0, 7, 14, 12, 9, 2, 10, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[6], q[5];
cx q[15], q[8];
cx q[5], q[6];
cx q[4], q[5];
cx q[5], q[6];
cx q[6], q[7];
cx q[6], q[5];
