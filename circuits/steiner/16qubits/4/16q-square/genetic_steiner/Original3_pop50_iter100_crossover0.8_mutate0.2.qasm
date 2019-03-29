// Initial wiring: [2, 15, 5, 7, 1, 6, 13, 10, 4, 9, 11, 14, 0, 3, 8, 12]
// Resulting wiring: [2, 15, 5, 7, 1, 6, 13, 10, 4, 9, 11, 14, 0, 3, 8, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[14], q[15];
cx q[4], q[11];
cx q[2], q[3];
