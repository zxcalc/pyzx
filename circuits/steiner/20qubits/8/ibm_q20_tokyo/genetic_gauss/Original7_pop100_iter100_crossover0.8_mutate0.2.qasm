// Initial wiring: [7, 1, 15, 18, 14, 2, 9, 19, 13, 12, 3, 16, 8, 10, 0, 11, 5, 17, 4, 6]
// Resulting wiring: [7, 1, 15, 18, 14, 2, 9, 19, 13, 12, 3, 16, 8, 10, 0, 11, 5, 17, 4, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[2];
cx q[13], q[8];
cx q[15], q[8];
cx q[16], q[2];
cx q[8], q[19];
cx q[7], q[8];
cx q[3], q[12];
