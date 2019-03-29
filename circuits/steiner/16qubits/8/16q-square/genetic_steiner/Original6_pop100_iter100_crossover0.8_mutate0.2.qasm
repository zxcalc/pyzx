// Initial wiring: [7, 1, 15, 6, 11, 10, 8, 4, 2, 14, 0, 3, 12, 5, 9, 13]
// Resulting wiring: [7, 1, 15, 6, 11, 10, 8, 4, 2, 14, 0, 3, 12, 5, 9, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[8];
cx q[10], q[5];
cx q[5], q[2];
cx q[13], q[12];
cx q[15], q[14];
cx q[15], q[8];
cx q[3], q[4];
cx q[2], q[3];
