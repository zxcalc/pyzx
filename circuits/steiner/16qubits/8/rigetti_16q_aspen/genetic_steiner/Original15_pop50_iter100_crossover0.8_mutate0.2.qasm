// Initial wiring: [9, 5, 15, 0, 11, 3, 13, 4, 1, 7, 2, 14, 10, 8, 12, 6]
// Resulting wiring: [9, 5, 15, 0, 11, 3, 13, 4, 1, 7, 2, 14, 10, 8, 12, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[8], q[7];
cx q[10], q[9];
cx q[13], q[12];
cx q[10], q[11];
cx q[6], q[7];
cx q[3], q[4];
cx q[2], q[3];
