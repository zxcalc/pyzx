// Initial wiring: [1, 9, 11, 12, 2, 8, 7, 15, 13, 10, 0, 5, 3, 14, 4, 6]
// Resulting wiring: [1, 9, 11, 12, 2, 8, 7, 15, 13, 10, 0, 5, 3, 14, 4, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[6], q[1];
cx q[8], q[15];
cx q[15], q[14];
