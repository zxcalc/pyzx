// Initial wiring: [15, 5, 13, 10, 0, 6, 1, 8, 11, 14, 4, 9, 7, 12, 3, 2]
// Resulting wiring: [15, 5, 13, 10, 0, 6, 1, 8, 11, 14, 4, 9, 7, 12, 3, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[14], q[13];
cx q[2], q[3];
cx q[1], q[2];
