// Initial wiring: [1, 15, 19, 14, 17, 6, 8, 12, 11, 4, 16, 9, 5, 10, 13, 0, 7, 18, 2, 3]
// Resulting wiring: [1, 15, 19, 14, 17, 6, 8, 12, 11, 4, 16, 9, 5, 10, 13, 0, 7, 18, 2, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[8];
cx q[13], q[6];
cx q[6], q[7];
cx q[4], q[6];
