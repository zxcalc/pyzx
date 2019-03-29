// Initial wiring: [13, 9, 11, 3, 1, 10, 14, 4, 0, 8, 15, 5, 12, 7, 2, 6]
// Resulting wiring: [13, 9, 11, 3, 1, 10, 14, 4, 0, 8, 15, 5, 12, 7, 2, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[4], q[3];
cx q[5], q[4];
cx q[7], q[6];
cx q[11], q[4];
cx q[4], q[3];
cx q[11], q[4];
cx q[13], q[10];
cx q[14], q[9];
cx q[11], q[12];
cx q[7], q[8];
cx q[0], q[1];
