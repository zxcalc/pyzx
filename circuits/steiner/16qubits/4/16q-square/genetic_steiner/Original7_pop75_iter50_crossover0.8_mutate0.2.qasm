// Initial wiring: [1, 5, 15, 12, 2, 13, 6, 9, 11, 14, 10, 7, 0, 3, 8, 4]
// Resulting wiring: [1, 5, 15, 12, 2, 13, 6, 9, 11, 14, 10, 7, 0, 3, 8, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[15], q[8];
cx q[8], q[7];
cx q[2], q[3];
