// Initial wiring: [5, 3, 2, 1, 9, 15, 17, 13, 8, 7, 10, 12, 18, 19, 4, 6, 11, 14, 0, 16]
// Resulting wiring: [5, 3, 2, 1, 9, 15, 17, 13, 8, 7, 10, 12, 18, 19, 4, 6, 11, 14, 0, 16]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[5], q[4];
cx q[6], q[4];
cx q[8], q[1];
cx q[17], q[16];
cx q[17], q[12];
cx q[19], q[18];
cx q[18], q[17];
cx q[15], q[16];
cx q[12], q[17];
cx q[11], q[12];
cx q[8], q[10];
cx q[7], q[8];
cx q[6], q[12];
cx q[12], q[17];
cx q[17], q[12];
cx q[1], q[2];
