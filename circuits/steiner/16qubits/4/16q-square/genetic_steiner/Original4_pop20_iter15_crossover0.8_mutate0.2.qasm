// Initial wiring: [3, 6, 15, 14, 1, 5, 0, 13, 4, 2, 9, 7, 11, 12, 10, 8]
// Resulting wiring: [3, 6, 15, 14, 1, 5, 0, 13, 4, 2, 9, 7, 11, 12, 10, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[0];
cx q[10], q[5];
cx q[12], q[11];
cx q[2], q[3];
