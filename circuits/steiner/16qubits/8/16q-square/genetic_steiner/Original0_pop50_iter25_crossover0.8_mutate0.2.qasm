// Initial wiring: [11, 9, 4, 7, 10, 8, 12, 3, 6, 14, 15, 1, 13, 0, 5, 2]
// Resulting wiring: [11, 9, 4, 7, 10, 8, 12, 3, 6, 14, 15, 1, 13, 0, 5, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[10], q[5];
cx q[14], q[9];
cx q[9], q[8];
cx q[15], q[14];
cx q[14], q[13];
cx q[15], q[14];
cx q[6], q[9];
cx q[3], q[4];
