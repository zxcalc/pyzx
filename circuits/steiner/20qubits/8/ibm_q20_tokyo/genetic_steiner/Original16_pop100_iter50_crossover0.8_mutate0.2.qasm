// Initial wiring: [13, 6, 8, 18, 4, 5, 19, 0, 1, 15, 12, 9, 16, 14, 10, 3, 7, 17, 2, 11]
// Resulting wiring: [13, 6, 8, 18, 4, 5, 19, 0, 1, 15, 12, 9, 16, 14, 10, 3, 7, 17, 2, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[5], q[4];
cx q[5], q[3];
cx q[7], q[6];
cx q[14], q[13];
cx q[15], q[13];
cx q[19], q[10];
cx q[9], q[11];
