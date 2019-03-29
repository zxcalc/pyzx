// Initial wiring: [3, 1, 16, 7, 15, 6, 14, 18, 17, 8, 2, 11, 10, 19, 0, 12, 4, 5, 13, 9]
// Resulting wiring: [3, 1, 16, 7, 15, 6, 14, 18, 17, 8, 2, 11, 10, 19, 0, 12, 4, 5, 13, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[8], q[1];
cx q[9], q[0];
cx q[14], q[5];
cx q[8], q[10];
cx q[3], q[6];
cx q[2], q[7];
cx q[7], q[2];
