// Initial wiring: [13, 7, 10, 4, 2, 1, 12, 3, 6, 14, 5, 0, 8, 15, 9, 11]
// Resulting wiring: [13, 7, 10, 4, 2, 1, 12, 3, 6, 14, 5, 0, 8, 15, 9, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[10], q[9];
cx q[9], q[8];
cx q[13], q[12];
cx q[10], q[11];
cx q[6], q[9];
cx q[4], q[11];
cx q[1], q[2];
