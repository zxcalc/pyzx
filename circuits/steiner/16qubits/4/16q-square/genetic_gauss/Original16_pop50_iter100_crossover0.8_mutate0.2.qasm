// Initial wiring: [11, 6, 10, 15, 5, 4, 9, 7, 3, 8, 1, 0, 12, 2, 13, 14]
// Resulting wiring: [11, 6, 10, 15, 5, 4, 9, 7, 3, 8, 1, 0, 12, 2, 13, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[1];
cx q[8], q[3];
cx q[14], q[0];
cx q[10], q[13];
