// Initial wiring: [15, 10, 8, 11, 5, 14, 13, 9, 7, 6, 4, 0, 3, 1, 2, 12]
// Resulting wiring: [15, 10, 8, 11, 5, 14, 13, 9, 7, 6, 4, 0, 3, 1, 2, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[6], q[9];
cx q[9], q[10];
cx q[2], q[3];
