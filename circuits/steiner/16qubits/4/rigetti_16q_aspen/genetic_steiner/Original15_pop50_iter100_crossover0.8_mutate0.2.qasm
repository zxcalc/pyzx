// Initial wiring: [12, 14, 9, 8, 15, 6, 5, 4, 3, 10, 0, 11, 2, 13, 7, 1]
// Resulting wiring: [12, 14, 9, 8, 15, 6, 5, 4, 3, 10, 0, 11, 2, 13, 7, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[12], q[13];
cx q[5], q[6];
cx q[0], q[7];
