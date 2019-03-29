// Initial wiring: [12, 0, 5, 14, 1, 7, 11, 8, 10, 4, 9, 6, 2, 15, 3, 13]
// Resulting wiring: [12, 0, 5, 14, 1, 7, 11, 8, 10, 4, 9, 6, 2, 15, 3, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[7], q[0];
cx q[13], q[12];
cx q[2], q[5];
