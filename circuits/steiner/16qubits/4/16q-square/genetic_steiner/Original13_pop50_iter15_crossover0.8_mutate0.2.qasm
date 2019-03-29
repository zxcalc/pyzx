// Initial wiring: [12, 14, 1, 9, 6, 15, 13, 5, 10, 4, 0, 2, 3, 8, 11, 7]
// Resulting wiring: [12, 14, 1, 9, 6, 15, 13, 5, 10, 4, 0, 2, 3, 8, 11, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[14], q[9];
cx q[11], q[12];
cx q[6], q[9];
