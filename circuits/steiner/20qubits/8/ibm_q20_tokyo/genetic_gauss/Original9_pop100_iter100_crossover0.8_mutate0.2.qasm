// Initial wiring: [15, 4, 3, 5, 11, 18, 16, 8, 9, 7, 13, 10, 12, 19, 2, 6, 14, 17, 1, 0]
// Resulting wiring: [15, 4, 3, 5, 11, 18, 16, 8, 9, 7, 13, 10, 12, 19, 2, 6, 14, 17, 1, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[8], q[3];
cx q[19], q[6];
cx q[18], q[9];
cx q[6], q[10];
cx q[10], q[17];
cx q[9], q[15];
cx q[0], q[6];
