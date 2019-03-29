// Initial wiring: [8, 0, 9, 4, 18, 15, 2, 5, 19, 14, 7, 1, 12, 6, 13, 10, 11, 3, 17, 16]
// Resulting wiring: [8, 0, 9, 4, 18, 15, 2, 5, 19, 14, 7, 1, 12, 6, 13, 10, 11, 3, 17, 16]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[5], q[3];
cx q[6], q[4];
cx q[7], q[2];
cx q[8], q[7];
cx q[13], q[7];
cx q[7], q[1];
cx q[13], q[6];
cx q[1], q[0];
cx q[6], q[4];
cx q[13], q[7];
cx q[16], q[14];
cx q[17], q[16];
cx q[16], q[15];
cx q[16], q[13];
cx q[18], q[12];
cx q[16], q[17];
cx q[11], q[12];
