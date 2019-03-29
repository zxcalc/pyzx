// Initial wiring: [0, 8, 15, 9, 5, 14, 12, 2, 11, 7, 13, 6, 4, 10, 3, 1]
// Resulting wiring: [0, 8, 15, 9, 5, 14, 12, 2, 11, 7, 13, 6, 4, 10, 3, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[13], q[12];
cx q[13], q[10];
cx q[12], q[11];
cx q[10], q[9];
cx q[13], q[10];
cx q[13], q[12];
cx q[14], q[9];
cx q[9], q[14];
cx q[7], q[8];
cx q[8], q[9];
cx q[9], q[14];
