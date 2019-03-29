// Initial wiring: [2, 9, 3, 0, 15, 6, 13, 4, 1, 14, 10, 11, 5, 8, 7, 12]
// Resulting wiring: [2, 9, 3, 0, 15, 6, 13, 4, 1, 14, 10, 11, 5, 8, 7, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[10];
cx q[10], q[9];
cx q[12], q[11];
cx q[6], q[7];
