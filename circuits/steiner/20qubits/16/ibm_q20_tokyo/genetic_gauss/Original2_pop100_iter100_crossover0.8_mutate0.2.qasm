// Initial wiring: [3, 16, 15, 5, 6, 8, 12, 19, 7, 11, 1, 14, 18, 4, 10, 17, 0, 13, 2, 9]
// Resulting wiring: [3, 16, 15, 5, 6, 8, 12, 19, 7, 11, 1, 14, 18, 4, 10, 17, 0, 13, 2, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[1];
cx q[16], q[13];
cx q[16], q[4];
cx q[18], q[17];
cx q[19], q[18];
cx q[17], q[1];
cx q[17], q[2];
cx q[6], q[8];
cx q[6], q[17];
cx q[10], q[15];
cx q[4], q[5];
cx q[1], q[14];
cx q[1], q[9];
cx q[0], q[6];
