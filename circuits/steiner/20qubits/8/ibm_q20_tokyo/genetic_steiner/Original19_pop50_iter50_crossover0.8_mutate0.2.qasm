// Initial wiring: [16, 0, 3, 12, 10, 9, 19, 7, 15, 11, 18, 1, 6, 14, 2, 17, 5, 13, 4, 8]
// Resulting wiring: [16, 0, 3, 12, 10, 9, 19, 7, 15, 11, 18, 1, 6, 14, 2, 17, 5, 13, 4, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[7];
cx q[10], q[9];
cx q[10], q[8];
cx q[13], q[15];
cx q[3], q[6];
cx q[6], q[7];
