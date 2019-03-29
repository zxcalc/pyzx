// Initial wiring: [9, 11, 8, 1, 15, 3, 6, 0, 7, 2, 12, 5, 13, 10, 14, 4]
// Resulting wiring: [9, 11, 8, 1, 15, 3, 6, 0, 7, 2, 12, 5, 13, 10, 14, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[13];
cx q[11], q[12];
cx q[5], q[10];
cx q[1], q[2];
