// Initial wiring: [11, 1, 12, 10, 9, 6, 0, 4, 14, 2, 8, 13, 3, 5, 7, 15]
// Resulting wiring: [11, 1, 12, 10, 9, 6, 0, 4, 14, 2, 8, 13, 3, 5, 7, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[11], q[4];
cx q[13], q[12];
cx q[13], q[2];
cx q[14], q[15];
cx q[9], q[10];
cx q[7], q[8];
cx q[3], q[12];
