// Initial wiring: [14, 7, 6, 2, 10, 5, 12, 15, 4, 8, 3, 0, 11, 13, 1, 9]
// Resulting wiring: [14, 7, 6, 2, 10, 5, 12, 15, 4, 8, 3, 0, 11, 13, 1, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[8];
cx q[15], q[14];
cx q[14], q[13];
cx q[9], q[14];
