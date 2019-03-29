// Initial wiring: [7, 12, 2, 8, 11, 6, 9, 15, 4, 3, 14, 1, 5, 10, 0, 13]
// Resulting wiring: [7, 12, 2, 8, 11, 6, 9, 15, 4, 3, 14, 1, 5, 10, 0, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[13], q[10];
cx q[10], q[9];
cx q[11], q[12];
