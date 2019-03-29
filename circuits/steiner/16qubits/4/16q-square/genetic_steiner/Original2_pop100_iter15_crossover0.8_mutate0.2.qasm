// Initial wiring: [15, 4, 1, 14, 12, 5, 6, 3, 0, 13, 9, 7, 2, 8, 11, 10]
// Resulting wiring: [15, 4, 1, 14, 12, 5, 6, 3, 0, 13, 9, 7, 2, 8, 11, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[6], q[1];
cx q[11], q[10];
cx q[13], q[14];
