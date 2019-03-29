// Initial wiring: [9, 8, 2, 0, 14, 11, 3, 13, 1, 12, 15, 4, 6, 7, 10, 5]
// Resulting wiring: [9, 8, 2, 0, 14, 11, 3, 13, 1, 12, 15, 4, 6, 7, 10, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[4], q[3];
cx q[7], q[0];
cx q[11], q[4];
cx q[4], q[3];
cx q[13], q[10];
cx q[14], q[9];
cx q[9], q[6];
cx q[15], q[14];
cx q[14], q[9];
cx q[9], q[6];
cx q[15], q[14];
