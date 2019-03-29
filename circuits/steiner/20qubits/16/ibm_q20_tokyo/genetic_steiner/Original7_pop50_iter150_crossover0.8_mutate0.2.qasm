// Initial wiring: [13, 16, 2, 18, 9, 12, 4, 1, 15, 7, 11, 10, 3, 8, 14, 0, 6, 17, 19, 5]
// Resulting wiring: [13, 16, 2, 18, 9, 12, 4, 1, 15, 7, 11, 10, 3, 8, 14, 0, 6, 17, 19, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[8], q[7];
cx q[10], q[9];
cx q[16], q[13];
cx q[13], q[7];
cx q[7], q[2];
cx q[16], q[13];
cx q[17], q[16];
cx q[18], q[17];
cx q[14], q[15];
cx q[11], q[17];
cx q[17], q[16];
cx q[8], q[9];
cx q[6], q[13];
cx q[6], q[12];
cx q[4], q[6];
cx q[6], q[13];
cx q[3], q[6];
cx q[1], q[8];
cx q[8], q[9];
