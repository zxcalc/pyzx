// Initial wiring: [9, 2, 11, 14, 19, 5, 10, 16, 1, 17, 6, 0, 13, 7, 3, 18, 12, 15, 4, 8]
// Resulting wiring: [9, 2, 11, 14, 19, 5, 10, 16, 1, 17, 6, 0, 13, 7, 3, 18, 12, 15, 4, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[7];
cx q[11], q[10];
cx q[12], q[7];
cx q[7], q[2];
cx q[13], q[12];
cx q[16], q[13];
cx q[13], q[12];
cx q[16], q[17];
cx q[14], q[16];
cx q[11], q[18];
cx q[10], q[19];
cx q[8], q[9];
cx q[7], q[12];
cx q[1], q[7];
cx q[7], q[12];
cx q[12], q[17];
cx q[7], q[6];
cx q[1], q[2];
cx q[0], q[1];
