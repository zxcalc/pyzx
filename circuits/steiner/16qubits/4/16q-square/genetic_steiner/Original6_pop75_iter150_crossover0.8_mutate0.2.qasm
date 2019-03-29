// Initial wiring: [2, 15, 7, 6, 9, 14, 10, 11, 5, 12, 3, 13, 4, 1, 0, 8]
// Resulting wiring: [2, 15, 7, 6, 9, 14, 10, 11, 5, 12, 3, 13, 4, 1, 0, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[6], q[5];
cx q[8], q[7];
cx q[11], q[12];
