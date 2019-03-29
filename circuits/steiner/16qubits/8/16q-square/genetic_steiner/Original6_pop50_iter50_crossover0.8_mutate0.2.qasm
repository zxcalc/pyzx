// Initial wiring: [12, 5, 11, 6, 15, 10, 0, 7, 9, 14, 4, 3, 8, 1, 2, 13]
// Resulting wiring: [12, 5, 11, 6, 15, 10, 0, 7, 9, 14, 4, 3, 8, 1, 2, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[3], q[2];
cx q[6], q[5];
cx q[5], q[4];
cx q[4], q[3];
cx q[15], q[14];
cx q[15], q[8];
cx q[9], q[14];
