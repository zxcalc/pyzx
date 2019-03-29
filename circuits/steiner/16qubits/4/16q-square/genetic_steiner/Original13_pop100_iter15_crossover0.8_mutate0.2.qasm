// Initial wiring: [15, 9, 8, 7, 0, 1, 11, 4, 13, 5, 6, 12, 14, 10, 3, 2]
// Resulting wiring: [15, 9, 8, 7, 0, 1, 11, 4, 13, 5, 6, 12, 14, 10, 3, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[12], q[11];
cx q[15], q[14];
cx q[6], q[7];
