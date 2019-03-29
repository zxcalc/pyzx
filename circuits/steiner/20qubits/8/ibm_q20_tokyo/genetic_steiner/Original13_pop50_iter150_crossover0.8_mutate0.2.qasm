// Initial wiring: [9, 1, 18, 8, 17, 16, 4, 10, 6, 12, 5, 15, 14, 7, 3, 13, 2, 11, 19, 0]
// Resulting wiring: [9, 1, 18, 8, 17, 16, 4, 10, 6, 12, 5, 15, 14, 7, 3, 13, 2, 11, 19, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[9];
cx q[12], q[11];
cx q[11], q[10];
cx q[12], q[6];
cx q[18], q[17];
cx q[14], q[15];
cx q[3], q[4];
