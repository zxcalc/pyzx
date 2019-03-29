// Initial wiring: [13, 8, 10, 17, 15, 5, 2, 4, 3, 16, 14, 18, 19, 7, 12, 9, 1, 0, 6, 11]
// Resulting wiring: [13, 8, 10, 17, 15, 5, 2, 4, 3, 16, 14, 18, 19, 7, 12, 9, 1, 0, 6, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[11], q[8];
cx q[11], q[9];
cx q[8], q[7];
cx q[17], q[16];
cx q[12], q[18];
cx q[18], q[19];
cx q[9], q[10];
