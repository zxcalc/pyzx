// Initial wiring: [7, 12, 17, 1, 3, 2, 10, 9, 18, 11, 6, 14, 8, 4, 15, 19, 5, 13, 0, 16]
// Resulting wiring: [7, 12, 17, 1, 3, 2, 10, 9, 18, 11, 6, 14, 8, 4, 15, 19, 5, 13, 0, 16]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[10], q[9];
cx q[11], q[9];
cx q[11], q[8];
cx q[12], q[6];
cx q[6], q[4];
cx q[13], q[7];
cx q[14], q[13];
cx q[13], q[7];
cx q[14], q[13];
cx q[17], q[12];
cx q[19], q[18];
cx q[18], q[11];
cx q[8], q[11];
cx q[4], q[5];
cx q[3], q[5];
cx q[2], q[8];
cx q[2], q[7];
cx q[1], q[8];
cx q[8], q[11];
cx q[11], q[8];
