// Initial wiring: [8, 2, 7, 4, 14, 16, 17, 11, 15, 12, 18, 10, 13, 6, 3, 19, 1, 9, 0, 5]
// Resulting wiring: [8, 2, 7, 4, 14, 16, 17, 11, 15, 12, 18, 10, 13, 6, 3, 19, 1, 9, 0, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[7], q[6];
cx q[7], q[2];
cx q[10], q[9];
cx q[15], q[14];
cx q[16], q[14];
cx q[18], q[12];
cx q[1], q[8];
