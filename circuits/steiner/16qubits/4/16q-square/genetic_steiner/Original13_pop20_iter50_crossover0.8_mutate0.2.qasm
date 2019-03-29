// Initial wiring: [7, 15, 10, 8, 2, 3, 4, 13, 0, 11, 1, 14, 12, 9, 6, 5]
// Resulting wiring: [7, 15, 10, 8, 2, 3, 4, 13, 0, 11, 1, 14, 12, 9, 6, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[9], q[6];
cx q[11], q[12];
cx q[4], q[5];
