// Initial wiring: [9, 6, 3, 0, 8, 15, 12, 11, 4, 7, 14, 5, 1, 2, 10, 13]
// Resulting wiring: [9, 6, 3, 0, 8, 15, 12, 11, 4, 7, 14, 5, 1, 2, 10, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[7], q[0];
cx q[11], q[12];
cx q[5], q[6];
