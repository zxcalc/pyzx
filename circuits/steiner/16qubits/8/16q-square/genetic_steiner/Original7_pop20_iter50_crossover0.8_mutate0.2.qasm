// Initial wiring: [15, 11, 2, 0, 8, 14, 3, 12, 1, 7, 5, 9, 4, 6, 10, 13]
// Resulting wiring: [15, 11, 2, 0, 8, 14, 3, 12, 1, 7, 5, 9, 4, 6, 10, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[4], q[3];
cx q[14], q[13];
cx q[15], q[14];
cx q[14], q[9];
cx q[15], q[14];
cx q[12], q[13];
cx q[1], q[6];
cx q[6], q[9];
