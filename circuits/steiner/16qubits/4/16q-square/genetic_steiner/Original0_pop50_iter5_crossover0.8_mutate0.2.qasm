// Initial wiring: [8, 2, 0, 5, 1, 4, 7, 11, 13, 9, 15, 12, 3, 14, 10, 6]
// Resulting wiring: [8, 2, 0, 5, 1, 4, 7, 11, 13, 9, 15, 12, 3, 14, 10, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[14], q[13];
cx q[13], q[12];
cx q[5], q[10];
