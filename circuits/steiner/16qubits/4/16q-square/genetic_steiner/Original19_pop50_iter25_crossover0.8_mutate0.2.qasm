// Initial wiring: [0, 2, 8, 9, 6, 15, 4, 13, 10, 5, 1, 11, 14, 7, 3, 12]
// Resulting wiring: [0, 2, 8, 9, 6, 15, 4, 13, 10, 5, 1, 11, 14, 7, 3, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[11], q[12];
cx q[5], q[6];
cx q[1], q[6];
