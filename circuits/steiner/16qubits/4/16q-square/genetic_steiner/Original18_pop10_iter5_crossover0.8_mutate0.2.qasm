// Initial wiring: [4, 5, 1, 15, 12, 6, 11, 10, 7, 0, 3, 9, 14, 2, 8, 13]
// Resulting wiring: [4, 5, 1, 15, 12, 6, 11, 10, 7, 0, 3, 9, 14, 2, 8, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[11];
cx q[13], q[12];
cx q[12], q[11];
cx q[13], q[12];
cx q[14], q[15];
cx q[4], q[11];
cx q[3], q[4];
