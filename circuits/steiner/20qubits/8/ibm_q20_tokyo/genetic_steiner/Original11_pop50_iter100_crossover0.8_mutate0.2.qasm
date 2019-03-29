// Initial wiring: [8, 12, 19, 5, 11, 17, 2, 16, 10, 13, 15, 1, 0, 7, 6, 14, 4, 18, 3, 9]
// Resulting wiring: [8, 12, 19, 5, 11, 17, 2, 16, 10, 13, 15, 1, 0, 7, 6, 14, 4, 18, 3, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[11], q[8];
cx q[12], q[11];
cx q[16], q[13];
cx q[13], q[7];
cx q[17], q[16];
cx q[17], q[12];
cx q[8], q[9];
cx q[6], q[12];
