// Initial wiring: [19, 18, 1, 9, 7, 15, 11, 5, 6, 13, 16, 10, 2, 4, 14, 0, 12, 3, 17, 8]
// Resulting wiring: [19, 18, 1, 9, 7, 15, 11, 5, 6, 13, 16, 10, 2, 4, 14, 0, 12, 3, 17, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[3];
cx q[7], q[2];
cx q[10], q[8];
cx q[13], q[7];
cx q[15], q[13];
cx q[13], q[6];
cx q[17], q[16];
cx q[16], q[13];
cx q[17], q[12];
cx q[19], q[18];
cx q[15], q[16];
cx q[3], q[6];
cx q[1], q[8];
cx q[0], q[1];
