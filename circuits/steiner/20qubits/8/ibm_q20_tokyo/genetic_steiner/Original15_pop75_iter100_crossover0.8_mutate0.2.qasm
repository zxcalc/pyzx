// Initial wiring: [13, 12, 18, 2, 8, 11, 6, 4, 15, 3, 14, 16, 10, 17, 0, 1, 5, 9, 19, 7]
// Resulting wiring: [13, 12, 18, 2, 8, 11, 6, 4, 15, 3, 14, 16, 10, 17, 0, 1, 5, 9, 19, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[7], q[2];
cx q[11], q[9];
cx q[9], q[0];
cx q[17], q[18];
cx q[8], q[9];
cx q[5], q[14];
cx q[3], q[6];
