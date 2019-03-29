// Initial wiring: [8, 4, 13, 9, 2, 10, 6, 7, 11, 15, 0, 14, 3, 5, 12, 1]
// Resulting wiring: [8, 4, 13, 9, 2, 10, 6, 7, 11, 15, 0, 14, 3, 5, 12, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[10], q[5];
cx q[11], q[4];
cx q[13], q[14];
cx q[6], q[9];
cx q[9], q[8];
cx q[5], q[6];
cx q[6], q[9];
cx q[3], q[4];
cx q[2], q[3];
cx q[3], q[4];
