// Initial wiring: [6, 4, 12, 3, 11, 7, 10, 9, 14, 2, 5, 8, 1, 15, 0, 13]
// Resulting wiring: [6, 4, 12, 3, 11, 7, 10, 9, 14, 2, 5, 8, 1, 15, 0, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[4];
cx q[15], q[0];
cx q[0], q[1];
cx q[5], q[7];
