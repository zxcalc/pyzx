// Initial wiring: [7, 2, 15, 0, 6, 9, 11, 5, 1, 10, 3, 12, 4, 8, 13, 14]
// Resulting wiring: [7, 2, 15, 0, 6, 9, 11, 5, 1, 10, 3, 12, 4, 8, 13, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[7], q[0];
cx q[12], q[11];
cx q[13], q[12];
cx q[12], q[11];
cx q[13], q[12];
cx q[8], q[15];
