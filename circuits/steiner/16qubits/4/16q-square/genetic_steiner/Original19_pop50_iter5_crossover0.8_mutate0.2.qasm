// Initial wiring: [15, 6, 5, 3, 10, 7, 2, 4, 13, 8, 9, 11, 14, 1, 0, 12]
// Resulting wiring: [15, 6, 5, 3, 10, 7, 2, 4, 13, 8, 9, 11, 14, 1, 0, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[11], q[12];
cx q[6], q[7];
cx q[0], q[7];
