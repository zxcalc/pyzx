// Initial wiring: [5, 11, 4, 0, 3, 6, 15, 8, 9, 2, 13, 10, 12, 7, 1, 14]
// Resulting wiring: [5, 11, 4, 0, 3, 6, 15, 8, 9, 2, 13, 10, 12, 7, 1, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[11], q[12];
cx q[10], q[13];
cx q[3], q[4];
