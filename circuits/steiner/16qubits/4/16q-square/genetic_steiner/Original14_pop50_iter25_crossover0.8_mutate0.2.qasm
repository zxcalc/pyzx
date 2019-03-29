// Initial wiring: [6, 10, 7, 15, 2, 1, 14, 12, 13, 0, 5, 11, 3, 4, 9, 8]
// Resulting wiring: [6, 10, 7, 15, 2, 1, 14, 12, 13, 0, 5, 11, 3, 4, 9, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[11], q[12];
cx q[0], q[7];
cx q[0], q[1];
