// Initial wiring: [10, 14, 8, 13, 6, 3, 11, 0, 1, 2, 9, 7, 5, 12, 15, 4]
// Resulting wiring: [10, 14, 8, 13, 6, 3, 11, 0, 1, 2, 9, 7, 5, 12, 15, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[10];
cx q[14], q[13];
cx q[9], q[10];
cx q[2], q[3];
