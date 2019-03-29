// Initial wiring: [0, 3, 10, 5, 6, 9, 15, 11, 8, 14, 2, 13, 1, 4, 12, 7]
// Resulting wiring: [0, 3, 10, 5, 6, 9, 15, 11, 8, 14, 2, 13, 1, 4, 12, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[10], q[11];
cx q[9], q[14];
cx q[14], q[13];
