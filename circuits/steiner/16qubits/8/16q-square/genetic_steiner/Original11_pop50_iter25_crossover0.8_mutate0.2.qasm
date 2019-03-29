// Initial wiring: [15, 12, 14, 9, 2, 13, 7, 10, 11, 1, 4, 6, 3, 8, 5, 0]
// Resulting wiring: [15, 12, 14, 9, 2, 13, 7, 10, 11, 1, 4, 6, 3, 8, 5, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[9], q[8];
cx q[11], q[4];
cx q[4], q[3];
cx q[11], q[4];
cx q[13], q[12];
cx q[14], q[15];
cx q[8], q[15];
cx q[2], q[3];
