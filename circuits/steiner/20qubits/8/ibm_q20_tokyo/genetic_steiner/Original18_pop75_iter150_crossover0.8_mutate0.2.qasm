// Initial wiring: [14, 17, 3, 18, 12, 8, 5, 9, 13, 2, 15, 16, 6, 11, 10, 19, 1, 4, 7, 0]
// Resulting wiring: [14, 17, 3, 18, 12, 8, 5, 9, 13, 2, 15, 16, 6, 11, 10, 19, 1, 4, 7, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[13], q[12];
cx q[18], q[19];
cx q[3], q[5];
cx q[3], q[4];
cx q[1], q[8];
