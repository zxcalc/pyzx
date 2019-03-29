// Initial wiring: [5, 11, 8, 13, 7, 1, 9, 6, 2, 10, 4, 0, 3, 14, 12, 15]
// Resulting wiring: [5, 11, 8, 13, 7, 1, 9, 6, 2, 10, 4, 0, 3, 14, 12, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[11], q[12];
cx q[9], q[14];
cx q[3], q[4];
