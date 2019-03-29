// Initial wiring: [9, 7, 13, 12, 15, 3, 6, 11, 4, 14, 10, 8, 0, 1, 5, 2]
// Resulting wiring: [9, 7, 13, 12, 15, 3, 6, 11, 4, 14, 10, 8, 0, 1, 5, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[8], q[7];
cx q[7], q[0];
cx q[14], q[13];
