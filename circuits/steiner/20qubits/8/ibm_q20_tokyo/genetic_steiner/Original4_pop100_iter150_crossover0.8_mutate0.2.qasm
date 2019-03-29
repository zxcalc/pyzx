// Initial wiring: [12, 18, 10, 9, 14, 19, 3, 8, 16, 6, 4, 7, 2, 1, 0, 13, 17, 11, 15, 5]
// Resulting wiring: [12, 18, 10, 9, 14, 19, 3, 8, 16, 6, 4, 7, 2, 1, 0, 13, 17, 11, 15, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[12], q[7];
cx q[13], q[6];
cx q[17], q[16];
cx q[17], q[11];
cx q[14], q[15];
cx q[12], q[18];
cx q[5], q[6];
