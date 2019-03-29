// Initial wiring: [12, 1, 5, 13, 14, 10, 4, 11, 9, 6, 7, 3, 8, 2, 0, 15]
// Resulting wiring: [12, 1, 5, 13, 14, 10, 4, 11, 9, 6, 7, 3, 8, 2, 0, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[15], q[0];
cx q[6], q[7];
cx q[7], q[8];
