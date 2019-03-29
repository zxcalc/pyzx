// Initial wiring: [12, 6, 10, 1, 4, 9, 11, 3, 8, 0, 13, 5, 14, 15, 7, 2]
// Resulting wiring: [12, 6, 10, 1, 4, 9, 11, 3, 8, 0, 13, 5, 14, 15, 7, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[13], q[14];
cx q[6], q[7];
cx q[1], q[2];
