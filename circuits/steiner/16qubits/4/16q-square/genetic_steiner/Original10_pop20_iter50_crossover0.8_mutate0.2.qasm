// Initial wiring: [13, 7, 0, 14, 15, 5, 8, 1, 9, 4, 10, 3, 11, 2, 6, 12]
// Resulting wiring: [13, 7, 0, 14, 15, 5, 8, 1, 9, 4, 10, 3, 11, 2, 6, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[7], q[0];
cx q[6], q[9];
cx q[6], q[7];
