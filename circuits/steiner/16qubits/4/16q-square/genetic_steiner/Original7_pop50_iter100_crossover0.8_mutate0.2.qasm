// Initial wiring: [3, 2, 6, 7, 0, 10, 5, 1, 11, 4, 14, 15, 12, 13, 8, 9]
// Resulting wiring: [3, 2, 6, 7, 0, 10, 5, 1, 11, 4, 14, 15, 12, 13, 8, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[8];
cx q[11], q[12];
cx q[8], q[15];
cx q[6], q[7];
