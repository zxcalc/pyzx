// Initial wiring: [5, 8, 3, 15, 0, 9, 11, 10, 14, 12, 7, 1, 4, 6, 13, 2]
// Resulting wiring: [5, 8, 3, 15, 0, 9, 11, 10, 14, 12, 7, 1, 4, 6, 13, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[5];
cx q[14], q[13];
cx q[13], q[12];
cx q[1], q[6];
