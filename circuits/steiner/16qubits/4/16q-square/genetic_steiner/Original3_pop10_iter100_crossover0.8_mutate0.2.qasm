// Initial wiring: [9, 5, 7, 11, 4, 6, 3, 10, 0, 13, 12, 8, 14, 1, 15, 2]
// Resulting wiring: [9, 5, 7, 11, 4, 6, 3, 10, 0, 13, 12, 8, 14, 1, 15, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[10];
cx q[13], q[12];
cx q[14], q[15];
cx q[1], q[2];
