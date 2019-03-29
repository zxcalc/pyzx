// Initial wiring: [6, 4, 13, 5, 12, 15, 0, 7, 11, 2, 9, 14, 10, 3, 8, 1]
// Resulting wiring: [6, 4, 13, 5, 12, 15, 0, 7, 11, 2, 9, 14, 10, 3, 8, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[13];
cx q[8], q[10];
cx q[6], q[13];
cx q[1], q[15];
