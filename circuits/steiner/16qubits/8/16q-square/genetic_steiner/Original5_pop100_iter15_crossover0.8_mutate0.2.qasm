// Initial wiring: [15, 10, 0, 14, 3, 12, 2, 7, 4, 1, 6, 13, 8, 11, 9, 5]
// Resulting wiring: [15, 10, 0, 14, 3, 12, 2, 7, 4, 1, 6, 13, 8, 11, 9, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[13], q[12];
cx q[14], q[15];
cx q[9], q[10];
cx q[10], q[11];
cx q[6], q[9];
cx q[9], q[8];
cx q[1], q[2];
