// Initial wiring: [4, 12, 9, 0, 10, 1, 14, 13, 2, 15, 5, 6, 3, 11, 7, 8]
// Resulting wiring: [4, 12, 9, 0, 10, 1, 14, 13, 2, 15, 5, 6, 3, 11, 7, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[1], q[0];
cx q[8], q[7];
cx q[11], q[10];
