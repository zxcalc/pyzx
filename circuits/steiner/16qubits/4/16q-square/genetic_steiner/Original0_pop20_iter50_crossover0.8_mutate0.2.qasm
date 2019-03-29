// Initial wiring: [8, 10, 9, 0, 13, 12, 14, 11, 6, 3, 5, 1, 4, 15, 7, 2]
// Resulting wiring: [8, 10, 9, 0, 13, 12, 14, 11, 6, 3, 5, 1, 4, 15, 7, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[10];
cx q[12], q[13];
cx q[1], q[6];
cx q[6], q[9];
