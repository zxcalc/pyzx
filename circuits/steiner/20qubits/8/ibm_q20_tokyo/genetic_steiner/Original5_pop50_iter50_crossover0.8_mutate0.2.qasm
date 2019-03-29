// Initial wiring: [17, 13, 18, 12, 3, 14, 8, 4, 5, 1, 6, 0, 9, 11, 15, 19, 16, 10, 7, 2]
// Resulting wiring: [17, 13, 18, 12, 3, 14, 8, 4, 5, 1, 6, 0, 9, 11, 15, 19, 16, 10, 7, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[6], q[5];
cx q[6], q[4];
cx q[11], q[9];
cx q[15], q[14];
cx q[18], q[12];
cx q[13], q[16];
cx q[9], q[10];
