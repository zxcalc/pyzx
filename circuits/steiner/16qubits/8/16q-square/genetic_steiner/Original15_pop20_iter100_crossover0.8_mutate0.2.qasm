// Initial wiring: [3, 1, 6, 11, 0, 15, 4, 13, 10, 14, 12, 5, 9, 7, 2, 8]
// Resulting wiring: [3, 1, 6, 11, 0, 15, 4, 13, 10, 14, 12, 5, 9, 7, 2, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[5], q[4];
cx q[7], q[6];
cx q[7], q[0];
cx q[14], q[13];
cx q[14], q[9];
cx q[15], q[8];
cx q[1], q[6];
