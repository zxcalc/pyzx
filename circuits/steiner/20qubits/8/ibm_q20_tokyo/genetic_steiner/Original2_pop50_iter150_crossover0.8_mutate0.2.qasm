// Initial wiring: [18, 0, 10, 2, 6, 4, 9, 1, 15, 13, 11, 3, 8, 7, 12, 16, 19, 5, 14, 17]
// Resulting wiring: [18, 0, 10, 2, 6, 4, 9, 1, 15, 13, 11, 3, 8, 7, 12, 16, 19, 5, 14, 17]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[3];
cx q[7], q[2];
cx q[11], q[8];
cx q[13], q[12];
cx q[17], q[11];
cx q[9], q[11];
cx q[5], q[6];
cx q[0], q[9];
