// Initial wiring: [3, 11, 12, 7, 1, 5, 6, 15, 10, 4, 2, 13, 9, 14, 8, 0]
// Resulting wiring: [3, 11, 12, 7, 1, 5, 6, 15, 10, 4, 2, 13, 9, 14, 8, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[6], q[1];
cx q[11], q[10];
cx q[13], q[10];
cx q[15], q[8];
cx q[8], q[7];
cx q[7], q[6];
cx q[11], q[12];
