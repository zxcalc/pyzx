// Initial wiring: [0, 5, 3, 1, 4, 7, 6, 9, 15, 2, 13, 12, 14, 8, 11, 10]
// Resulting wiring: [0, 5, 3, 1, 4, 7, 6, 9, 15, 2, 13, 12, 14, 8, 11, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[12], q[11];
cx q[11], q[4];
cx q[9], q[10];
