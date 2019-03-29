// Initial wiring: [9, 10, 5, 13, 8, 0, 1, 2, 12, 7, 14, 4, 11, 3, 6, 15]
// Resulting wiring: [9, 10, 5, 13, 8, 0, 1, 2, 12, 7, 14, 4, 11, 3, 6, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[10], q[9];
cx q[15], q[8];
cx q[8], q[7];
cx q[13], q[14];
cx q[11], q[12];
cx q[5], q[6];
cx q[0], q[7];
