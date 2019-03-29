// Initial wiring: [9, 0, 2, 10, 3, 6, 5, 15, 11, 8, 12, 1, 4, 14, 13, 7]
// Resulting wiring: [9, 0, 2, 10, 3, 6, 5, 15, 11, 8, 12, 1, 4, 14, 13, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[8];
cx q[10], q[9];
cx q[9], q[8];
cx q[8], q[7];
cx q[12], q[11];
cx q[11], q[10];
cx q[10], q[9];
cx q[12], q[11];
cx q[13], q[12];
cx q[12], q[11];
cx q[11], q[10];
cx q[12], q[11];
cx q[8], q[15];
cx q[8], q[9];
