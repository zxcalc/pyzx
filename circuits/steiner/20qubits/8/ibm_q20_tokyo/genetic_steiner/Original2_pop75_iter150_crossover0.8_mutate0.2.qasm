// Initial wiring: [19, 6, 11, 4, 2, 9, 0, 8, 7, 17, 12, 15, 3, 5, 16, 1, 10, 14, 13, 18]
// Resulting wiring: [19, 6, 11, 4, 2, 9, 0, 8, 7, 17, 12, 15, 3, 5, 16, 1, 10, 14, 13, 18]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[7];
cx q[12], q[11];
cx q[13], q[12];
cx q[18], q[12];
cx q[19], q[18];
cx q[15], q[16];
cx q[3], q[5];
cx q[3], q[4];
