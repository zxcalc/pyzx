// Initial wiring: [11, 14, 12, 1, 9, 7, 3, 8, 0, 10, 5, 6, 2, 4, 15, 13]
// Resulting wiring: [11, 14, 12, 1, 9, 7, 3, 8, 0, 10, 5, 6, 2, 4, 15, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[15], q[14];
cx q[14], q[13];
cx q[15], q[14];
cx q[12], q[13];
cx q[0], q[1];
