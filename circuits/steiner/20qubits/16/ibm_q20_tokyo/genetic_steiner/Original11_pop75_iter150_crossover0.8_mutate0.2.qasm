// Initial wiring: [12, 9, 8, 10, 18, 17, 7, 16, 14, 3, 19, 5, 15, 1, 6, 0, 4, 13, 2, 11]
// Resulting wiring: [12, 9, 8, 10, 18, 17, 7, 16, 14, 3, 19, 5, 15, 1, 6, 0, 4, 13, 2, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[6];
cx q[7], q[2];
cx q[7], q[1];
cx q[10], q[8];
cx q[12], q[11];
cx q[16], q[13];
cx q[16], q[15];
cx q[13], q[6];
cx q[17], q[11];
cx q[19], q[18];
cx q[14], q[15];
cx q[10], q[11];
cx q[9], q[11];
cx q[8], q[9];
cx q[3], q[5];
