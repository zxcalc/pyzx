// Initial wiring: [7, 4, 11, 6, 15, 5, 2, 13, 12, 14, 9, 0, 3, 1, 8, 10]
// Resulting wiring: [7, 4, 11, 6, 15, 5, 2, 13, 12, 14, 9, 0, 3, 1, 8, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[0];
cx q[15], q[8];
cx q[11], q[12];
cx q[2], q[5];
