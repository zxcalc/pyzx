// Initial wiring: [18, 17, 10, 12, 6, 2, 0, 1, 7, 8, 19, 14, 5, 4, 11, 15, 9, 16, 3, 13]
// Resulting wiring: [18, 17, 10, 12, 6, 2, 0, 1, 7, 8, 19, 14, 5, 4, 11, 15, 9, 16, 3, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[1];
cx q[11], q[9];
cx q[11], q[8];
cx q[13], q[12];
cx q[13], q[7];
cx q[13], q[6];
cx q[14], q[5];
cx q[15], q[13];
cx q[13], q[12];
cx q[15], q[13];
cx q[17], q[11];
cx q[11], q[9];
cx q[11], q[8];
cx q[17], q[16];
cx q[17], q[11];
cx q[19], q[18];
cx q[18], q[12];
cx q[19], q[18];
cx q[11], q[12];
cx q[10], q[11];
cx q[11], q[18];
cx q[11], q[12];
cx q[7], q[8];
cx q[4], q[6];
