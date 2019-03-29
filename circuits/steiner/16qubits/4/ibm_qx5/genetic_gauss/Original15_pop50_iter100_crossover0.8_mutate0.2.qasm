// Initial wiring: [9, 0, 3, 12, 11, 4, 1, 7, 8, 6, 15, 2, 5, 14, 13, 10]
// Resulting wiring: [9, 0, 3, 12, 11, 4, 1, 7, 8, 6, 15, 2, 5, 14, 13, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[3];
cx q[11], q[14];
cx q[9], q[12];
cx q[3], q[5];
