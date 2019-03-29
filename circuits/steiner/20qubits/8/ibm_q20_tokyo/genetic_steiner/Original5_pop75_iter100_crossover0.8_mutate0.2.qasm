// Initial wiring: [18, 12, 14, 1, 0, 13, 6, 3, 8, 2, 15, 19, 17, 10, 7, 4, 9, 5, 11, 16]
// Resulting wiring: [18, 12, 14, 1, 0, 13, 6, 3, 8, 2, 15, 19, 17, 10, 7, 4, 9, 5, 11, 16]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[4], q[3];
cx q[8], q[7];
cx q[8], q[2];
cx q[11], q[10];
cx q[18], q[19];
cx q[14], q[16];
cx q[3], q[6];
