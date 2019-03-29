// Initial wiring: [10, 19, 2, 6, 12, 7, 5, 18, 11, 3, 13, 16, 15, 1, 8, 0, 17, 4, 14, 9]
// Resulting wiring: [10, 19, 2, 6, 12, 7, 5, 18, 11, 3, 13, 16, 15, 1, 8, 0, 17, 4, 14, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[18], q[12];
cx q[18], q[17];
cx q[12], q[6];
cx q[14], q[16];
cx q[9], q[10];
cx q[1], q[8];
