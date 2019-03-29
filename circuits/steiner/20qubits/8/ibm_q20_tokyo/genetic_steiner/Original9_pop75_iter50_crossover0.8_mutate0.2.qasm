// Initial wiring: [10, 7, 8, 9, 5, 11, 18, 1, 6, 12, 19, 15, 3, 14, 4, 2, 17, 13, 16, 0]
// Resulting wiring: [10, 7, 8, 9, 5, 11, 18, 1, 6, 12, 19, 15, 3, 14, 4, 2, 17, 13, 16, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[7], q[1];
cx q[19], q[18];
cx q[18], q[17];
cx q[17], q[16];
cx q[11], q[18];
cx q[3], q[4];
cx q[1], q[8];
