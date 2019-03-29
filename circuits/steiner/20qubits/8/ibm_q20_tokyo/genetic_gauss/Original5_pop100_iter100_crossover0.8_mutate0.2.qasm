// Initial wiring: [0, 17, 3, 1, 14, 16, 12, 10, 13, 19, 9, 18, 6, 4, 8, 2, 15, 5, 7, 11]
// Resulting wiring: [0, 17, 3, 1, 14, 16, 12, 10, 13, 19, 9, 18, 6, 4, 8, 2, 15, 5, 7, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[14], q[2];
cx q[14], q[4];
cx q[19], q[5];
cx q[18], q[10];
cx q[6], q[11];
cx q[9], q[16];
cx q[0], q[3];
cx q[3], q[12];
