// Initial wiring: [14, 10, 9, 19, 12, 6, 15, 8, 13, 2, 1, 4, 5, 3, 18, 17, 7, 0, 11, 16]
// Resulting wiring: [14, 10, 9, 19, 12, 6, 15, 8, 13, 2, 1, 4, 5, 3, 18, 17, 7, 0, 11, 16]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[4], q[3];
cx q[11], q[9];
cx q[17], q[11];
cx q[11], q[10];
cx q[17], q[11];
cx q[19], q[10];
cx q[10], q[8];
cx q[8], q[2];
cx q[18], q[19];
cx q[16], q[17];
cx q[13], q[16];
cx q[13], q[14];
cx q[12], q[13];
cx q[12], q[17];
cx q[13], q[16];
cx q[11], q[18];
cx q[18], q[19];
cx q[11], q[12];
cx q[19], q[18];
cx q[4], q[6];
cx q[1], q[7];
