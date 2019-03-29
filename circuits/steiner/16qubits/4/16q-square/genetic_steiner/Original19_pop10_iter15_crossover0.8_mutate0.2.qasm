// Initial wiring: [13, 12, 3, 7, 5, 8, 2, 4, 15, 6, 9, 11, 14, 0, 1, 10]
// Resulting wiring: [13, 12, 3, 7, 5, 8, 2, 4, 15, 6, 9, 11, 14, 0, 1, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[11], q[12];
cx q[6], q[7];
cx q[0], q[7];
