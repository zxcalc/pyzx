// Initial wiring: [19, 11, 0, 10, 13, 17, 14, 6, 5, 7, 18, 4, 2, 16, 8, 3, 1, 15, 12, 9]
// Resulting wiring: [19, 11, 0, 10, 13, 17, 14, 6, 5, 7, 18, 4, 2, 16, 8, 3, 1, 15, 12, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[16], q[15];
cx q[12], q[17];
cx q[12], q[14];
cx q[10], q[18];
cx q[2], q[4];
cx q[1], q[5];
cx q[0], q[15];
cx q[1], q[9];
