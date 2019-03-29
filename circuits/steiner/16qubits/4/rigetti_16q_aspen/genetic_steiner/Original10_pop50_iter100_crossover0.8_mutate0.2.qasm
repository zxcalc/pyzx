// Initial wiring: [2, 12, 3, 11, 5, 13, 9, 1, 8, 10, 7, 0, 6, 15, 14, 4]
// Resulting wiring: [2, 12, 3, 11, 5, 13, 9, 1, 8, 10, 7, 0, 6, 15, 14, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[6], q[5];
cx q[7], q[6];
cx q[8], q[7];
cx q[8], q[15];
cx q[6], q[7];
