// Initial wiring: [14, 7, 8, 11, 10, 13, 2, 18, 3, 9, 15, 19, 1, 4, 6, 5, 17, 16, 12, 0]
// Resulting wiring: [14, 7, 8, 11, 10, 13, 2, 18, 3, 9, 15, 19, 1, 4, 6, 5, 17, 16, 12, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[12], q[8];
cx q[16], q[12];
cx q[16], q[6];
cx q[17], q[7];
cx q[19], q[14];
cx q[7], q[17];
cx q[2], q[8];
