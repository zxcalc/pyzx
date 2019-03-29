// Initial wiring: [19, 7, 8, 3, 13, 14, 11, 2, 0, 5, 9, 18, 6, 10, 1, 17, 12, 4, 15, 16]
// Resulting wiring: [19, 7, 8, 3, 13, 14, 11, 2, 0, 5, 9, 18, 6, 10, 1, 17, 12, 4, 15, 16]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[11], q[8];
cx q[12], q[11];
cx q[11], q[8];
cx q[12], q[7];
cx q[18], q[17];
cx q[15], q[16];
cx q[14], q[16];
cx q[12], q[17];
cx q[11], q[17];
cx q[9], q[10];
cx q[3], q[6];
cx q[6], q[13];
cx q[6], q[12];
cx q[6], q[3];
cx q[0], q[9];
cx q[9], q[8];
cx q[8], q[2];
