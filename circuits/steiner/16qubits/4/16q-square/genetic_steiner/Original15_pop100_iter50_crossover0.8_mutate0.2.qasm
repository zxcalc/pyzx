// Initial wiring: [13, 11, 10, 8, 3, 5, 6, 2, 9, 4, 12, 14, 0, 7, 15, 1]
// Resulting wiring: [13, 11, 10, 8, 3, 5, 6, 2, 9, 4, 12, 14, 0, 7, 15, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[7], q[0];
cx q[11], q[10];
cx q[10], q[9];
