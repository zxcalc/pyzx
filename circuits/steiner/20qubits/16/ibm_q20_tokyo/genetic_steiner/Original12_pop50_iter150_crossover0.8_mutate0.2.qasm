// Initial wiring: [15, 7, 5, 4, 9, 2, 10, 17, 8, 3, 14, 0, 11, 13, 6, 19, 16, 12, 18, 1]
// Resulting wiring: [15, 7, 5, 4, 9, 2, 10, 17, 8, 3, 14, 0, 11, 13, 6, 19, 16, 12, 18, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[7], q[1];
cx q[9], q[0];
cx q[10], q[9];
cx q[9], q[0];
cx q[11], q[9];
cx q[17], q[12];
cx q[19], q[10];
cx q[10], q[9];
cx q[13], q[15];
cx q[6], q[7];
cx q[5], q[6];
cx q[6], q[13];
cx q[6], q[7];
cx q[3], q[6];
cx q[3], q[4];
cx q[2], q[8];
cx q[0], q[9];
cx q[0], q[1];
