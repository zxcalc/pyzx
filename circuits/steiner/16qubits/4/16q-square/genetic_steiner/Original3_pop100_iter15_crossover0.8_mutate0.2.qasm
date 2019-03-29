// Initial wiring: [3, 13, 14, 1, 0, 15, 2, 11, 9, 6, 12, 8, 5, 7, 10, 4]
// Resulting wiring: [3, 13, 14, 1, 0, 15, 2, 11, 9, 6, 12, 8, 5, 7, 10, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[11], q[10];
cx q[12], q[13];
cx q[5], q[6];
