// Initial wiring: [17, 1, 5, 6, 4, 10, 2, 18, 19, 7, 0, 9, 16, 14, 11, 15, 8, 3, 12, 13]
// Resulting wiring: [17, 1, 5, 6, 4, 10, 2, 18, 19, 7, 0, 9, 16, 14, 11, 15, 8, 3, 12, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[3];
cx q[9], q[8];
cx q[13], q[7];
cx q[17], q[16];
cx q[18], q[12];
cx q[19], q[18];
cx q[17], q[18];
cx q[11], q[18];
cx q[11], q[12];
cx q[10], q[19];
cx q[9], q[11];
cx q[8], q[11];
cx q[5], q[6];
cx q[2], q[3];
cx q[3], q[6];
cx q[3], q[4];
cx q[0], q[9];
cx q[9], q[10];
cx q[10], q[19];
cx q[9], q[8];
