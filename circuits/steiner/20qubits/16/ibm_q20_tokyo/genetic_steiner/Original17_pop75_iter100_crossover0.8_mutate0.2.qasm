// Initial wiring: [0, 15, 18, 16, 7, 5, 17, 13, 8, 1, 4, 19, 6, 9, 12, 14, 10, 3, 2, 11]
// Resulting wiring: [0, 15, 18, 16, 7, 5, 17, 13, 8, 1, 4, 19, 6, 9, 12, 14, 10, 3, 2, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[6], q[3];
cx q[7], q[2];
cx q[12], q[11];
cx q[11], q[9];
cx q[12], q[11];
cx q[14], q[13];
cx q[14], q[5];
cx q[16], q[14];
cx q[17], q[11];
cx q[11], q[10];
cx q[17], q[11];
cx q[17], q[18];
cx q[13], q[16];
cx q[11], q[17];
cx q[9], q[10];
cx q[6], q[12];
cx q[12], q[11];
cx q[11], q[10];
cx q[11], q[9];
cx q[11], q[12];
cx q[3], q[5];
