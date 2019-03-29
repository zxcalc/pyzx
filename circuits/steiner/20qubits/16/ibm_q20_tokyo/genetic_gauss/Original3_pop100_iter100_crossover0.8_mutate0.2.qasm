// Initial wiring: [12, 5, 14, 16, 4, 8, 13, 1, 0, 11, 2, 10, 3, 7, 19, 17, 6, 15, 18, 9]
// Resulting wiring: [12, 5, 14, 16, 4, 8, 13, 1, 0, 11, 2, 10, 3, 7, 19, 17, 6, 15, 18, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[4], q[2];
cx q[8], q[1];
cx q[9], q[8];
cx q[11], q[10];
cx q[6], q[2];
cx q[8], q[3];
cx q[15], q[4];
cx q[19], q[4];
cx q[14], q[15];
cx q[17], q[18];
cx q[9], q[18];
cx q[9], q[13];
cx q[6], q[12];
cx q[5], q[16];
cx q[4], q[14];
