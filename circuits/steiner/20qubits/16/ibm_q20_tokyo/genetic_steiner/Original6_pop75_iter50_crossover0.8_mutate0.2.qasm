// Initial wiring: [14, 0, 1, 12, 3, 2, 4, 5, 11, 16, 9, 6, 17, 10, 13, 7, 19, 18, 8, 15]
// Resulting wiring: [14, 0, 1, 12, 3, 2, 4, 5, 11, 16, 9, 6, 17, 10, 13, 7, 19, 18, 8, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[3], q[2];
cx q[7], q[2];
cx q[17], q[11];
cx q[18], q[12];
cx q[19], q[10];
cx q[10], q[8];
cx q[16], q[17];
cx q[9], q[11];
cx q[7], q[8];
cx q[6], q[7];
cx q[7], q[8];
cx q[4], q[5];
cx q[2], q[3];
cx q[1], q[2];
cx q[2], q[3];
cx q[3], q[6];
cx q[1], q[8];
cx q[3], q[2];
