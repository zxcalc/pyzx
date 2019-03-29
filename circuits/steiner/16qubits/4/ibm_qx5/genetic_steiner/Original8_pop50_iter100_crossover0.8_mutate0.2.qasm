// Initial wiring: [2, 13, 11, 0, 14, 5, 3, 10, 7, 15, 9, 4, 6, 8, 1, 12]
// Resulting wiring: [2, 13, 11, 0, 14, 5, 3, 10, 7, 15, 9, 4, 6, 8, 1, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[3];
cx q[1], q[2];
cx q[1], q[14];
cx q[2], q[13];
