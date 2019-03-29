// Initial wiring: [2, 4, 12, 3, 0, 15, 1, 10, 9, 7, 16, 18, 14, 6, 11, 19, 5, 17, 8, 13]
// Resulting wiring: [2, 4, 12, 3, 0, 15, 1, 10, 9, 7, 16, 18, 14, 6, 11, 19, 5, 17, 8, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[11], q[9];
cx q[13], q[12];
cx q[13], q[16];
cx q[13], q[14];
