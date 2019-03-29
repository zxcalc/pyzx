// Initial wiring: [10, 4, 11, 19, 9, 7, 6, 1, 15, 8, 5, 3, 16, 14, 13, 2, 17, 18, 12, 0]
// Resulting wiring: [10, 4, 11, 19, 9, 7, 6, 1, 15, 8, 5, 3, 16, 14, 13, 2, 17, 18, 12, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[7], q[6];
cx q[7], q[1];
cx q[8], q[2];
cx q[8], q[1];
cx q[14], q[5];
cx q[18], q[12];
cx q[2], q[7];
