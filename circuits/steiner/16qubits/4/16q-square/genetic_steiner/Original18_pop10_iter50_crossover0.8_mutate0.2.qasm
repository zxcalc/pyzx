// Initial wiring: [8, 13, 1, 10, 6, 0, 3, 14, 11, 7, 9, 2, 5, 12, 15, 4]
// Resulting wiring: [8, 13, 1, 10, 6, 0, 3, 14, 11, 7, 9, 2, 5, 12, 15, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[10];
cx q[13], q[10];
cx q[14], q[13];
cx q[0], q[1];
