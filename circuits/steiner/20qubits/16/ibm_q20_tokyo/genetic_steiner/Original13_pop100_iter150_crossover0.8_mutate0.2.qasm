// Initial wiring: [5, 1, 3, 4, 15, 18, 9, 17, 14, 19, 16, 6, 0, 2, 12, 11, 8, 10, 7, 13]
// Resulting wiring: [5, 1, 3, 4, 15, 18, 9, 17, 14, 19, 16, 6, 0, 2, 12, 11, 8, 10, 7, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[7];
cx q[8], q[1];
cx q[11], q[10];
cx q[12], q[11];
cx q[14], q[13];
cx q[13], q[7];
cx q[14], q[5];
cx q[14], q[13];
cx q[17], q[11];
cx q[19], q[10];
cx q[10], q[8];
cx q[8], q[7];
cx q[10], q[9];
cx q[10], q[8];
cx q[15], q[16];
cx q[12], q[18];
cx q[11], q[12];
cx q[9], q[11];
cx q[8], q[11];
cx q[11], q[12];
cx q[12], q[11];
cx q[6], q[13];
cx q[6], q[12];
cx q[3], q[5];
