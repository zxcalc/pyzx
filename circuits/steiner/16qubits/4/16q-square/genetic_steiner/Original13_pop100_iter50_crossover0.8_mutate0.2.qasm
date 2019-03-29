// Initial wiring: [0, 11, 4, 13, 5, 9, 6, 1, 7, 8, 15, 10, 3, 2, 14, 12]
// Resulting wiring: [0, 11, 4, 13, 5, 9, 6, 1, 7, 8, 15, 10, 3, 2, 14, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[13], q[12];
cx q[14], q[15];
cx q[1], q[2];
