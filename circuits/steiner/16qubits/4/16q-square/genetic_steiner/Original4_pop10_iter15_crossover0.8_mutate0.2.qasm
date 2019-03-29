// Initial wiring: [13, 8, 12, 6, 15, 5, 4, 3, 2, 10, 9, 14, 0, 7, 11, 1]
// Resulting wiring: [13, 8, 12, 6, 15, 5, 4, 3, 2, 10, 9, 14, 0, 7, 11, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[5];
cx q[14], q[13];
cx q[4], q[11];
cx q[0], q[7];
