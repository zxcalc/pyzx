// Initial wiring: [15, 6, 0, 1, 8, 7, 16, 4, 14, 5, 19, 3, 18, 9, 12, 17, 10, 2, 11, 13]
// Resulting wiring: [15, 6, 0, 1, 8, 7, 16, 4, 14, 5, 19, 3, 18, 9, 12, 17, 10, 2, 11, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[5];
cx q[6], q[4];
cx q[6], q[3];
cx q[7], q[6];
cx q[6], q[3];
cx q[7], q[2];
cx q[7], q[6];
cx q[10], q[8];
cx q[11], q[9];
cx q[16], q[15];
cx q[18], q[17];
cx q[19], q[10];
cx q[10], q[9];
cx q[19], q[10];
cx q[8], q[11];
cx q[6], q[13];
cx q[3], q[5];
cx q[1], q[2];
cx q[0], q[9];
