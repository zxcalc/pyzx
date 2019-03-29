// Initial wiring: [19, 3, 16, 18, 14, 15, 10, 8, 12, 9, 7, 13, 5, 6, 1, 2, 4, 11, 0, 17]
// Resulting wiring: [19, 3, 16, 18, 14, 15, 10, 8, 12, 9, 7, 13, 5, 6, 1, 2, 4, 11, 0, 17]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[9], q[8];
cx q[8], q[2];
cx q[9], q[0];
cx q[10], q[9];
cx q[11], q[8];
cx q[19], q[10];
cx q[10], q[9];
cx q[9], q[0];
cx q[12], q[13];
cx q[13], q[15];
cx q[11], q[18];
cx q[10], q[11];
cx q[11], q[18];
cx q[6], q[13];
cx q[13], q[16];
cx q[1], q[8];
cx q[1], q[7];
cx q[0], q[9];
