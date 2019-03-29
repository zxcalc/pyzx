// Initial wiring: [11, 3, 15, 5, 8, 14, 10, 13, 2, 1, 7, 9, 12, 6, 0, 4]
// Resulting wiring: [11, 3, 15, 5, 8, 14, 10, 13, 2, 1, 7, 9, 12, 6, 0, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[0];
cx q[9], q[8];
cx q[10], q[13];
cx q[1], q[2];
