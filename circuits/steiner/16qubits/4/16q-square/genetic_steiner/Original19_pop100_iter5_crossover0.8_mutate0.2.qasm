// Initial wiring: [9, 10, 5, 12, 14, 7, 13, 8, 3, 4, 15, 11, 6, 0, 2, 1]
// Resulting wiring: [9, 10, 5, 12, 14, 7, 13, 8, 3, 4, 15, 11, 6, 0, 2, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[11], q[4];
cx q[14], q[9];
cx q[6], q[9];
