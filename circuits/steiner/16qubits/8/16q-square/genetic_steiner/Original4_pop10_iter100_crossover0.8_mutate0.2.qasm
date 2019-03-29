// Initial wiring: [13, 11, 0, 7, 10, 15, 1, 14, 12, 9, 6, 3, 4, 5, 2, 8]
// Resulting wiring: [13, 11, 0, 7, 10, 15, 1, 14, 12, 9, 6, 3, 4, 5, 2, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[14], q[9];
cx q[15], q[14];
cx q[14], q[13];
cx q[12], q[13];
cx q[9], q[14];
cx q[5], q[6];
cx q[1], q[2];
