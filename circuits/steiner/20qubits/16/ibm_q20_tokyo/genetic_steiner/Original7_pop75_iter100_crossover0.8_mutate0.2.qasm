// Initial wiring: [5, 12, 11, 10, 17, 19, 6, 13, 7, 3, 16, 4, 1, 2, 0, 14, 9, 18, 8, 15]
// Resulting wiring: [5, 12, 11, 10, 17, 19, 6, 13, 7, 3, 16, 4, 1, 2, 0, 14, 9, 18, 8, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[10], q[8];
cx q[11], q[9];
cx q[15], q[14];
cx q[17], q[11];
cx q[19], q[18];
cx q[18], q[12];
cx q[19], q[18];
cx q[17], q[18];
cx q[16], q[17];
cx q[17], q[18];
cx q[12], q[13];
cx q[10], q[19];
cx q[6], q[13];
cx q[6], q[12];
cx q[5], q[6];
cx q[3], q[6];
cx q[3], q[4];
cx q[2], q[8];
