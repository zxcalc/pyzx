// Initial wiring: [10, 2, 8, 11, 6, 12, 5, 3, 13, 4, 0, 1, 15, 7, 14, 9]
// Resulting wiring: [10, 2, 8, 11, 6, 12, 5, 3, 13, 4, 0, 1, 15, 7, 14, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[13], q[12];
cx q[9], q[14];
cx q[9], q[10];
cx q[8], q[15];
cx q[6], q[7];
cx q[1], q[2];
cx q[0], q[7];
