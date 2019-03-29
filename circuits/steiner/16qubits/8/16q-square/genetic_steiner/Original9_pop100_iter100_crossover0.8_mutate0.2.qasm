// Initial wiring: [4, 7, 9, 0, 13, 2, 15, 11, 3, 1, 8, 14, 6, 10, 12, 5]
// Resulting wiring: [4, 7, 9, 0, 13, 2, 15, 11, 3, 1, 8, 14, 6, 10, 12, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[5];
cx q[14], q[13];
cx q[13], q[12];
cx q[12], q[11];
cx q[14], q[13];
cx q[10], q[13];
cx q[8], q[15];
cx q[6], q[9];
cx q[9], q[8];
