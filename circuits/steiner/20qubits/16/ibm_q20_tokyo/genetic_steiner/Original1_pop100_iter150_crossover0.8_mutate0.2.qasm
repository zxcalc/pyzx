// Initial wiring: [15, 4, 10, 11, 2, 3, 6, 0, 18, 14, 8, 1, 9, 5, 13, 7, 19, 12, 17, 16]
// Resulting wiring: [15, 4, 10, 11, 2, 3, 6, 0, 18, 14, 8, 1, 9, 5, 13, 7, 19, 12, 17, 16]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[3];
cx q[3], q[2];
cx q[6], q[4];
cx q[8], q[1];
cx q[13], q[12];
cx q[16], q[13];
cx q[13], q[7];
cx q[18], q[17];
cx q[11], q[17];
cx q[7], q[8];
cx q[8], q[10];
cx q[6], q[7];
cx q[7], q[8];
cx q[8], q[10];
cx q[3], q[5];
cx q[5], q[14];
cx q[3], q[6];
cx q[0], q[1];
