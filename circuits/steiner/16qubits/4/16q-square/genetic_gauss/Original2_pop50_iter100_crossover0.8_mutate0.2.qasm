// Initial wiring: [0, 15, 10, 2, 12, 3, 7, 8, 14, 11, 6, 13, 5, 4, 1, 9]
// Resulting wiring: [0, 15, 10, 2, 12, 3, 7, 8, 14, 11, 6, 13, 5, 4, 1, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[10];
cx q[7], q[9];
cx q[6], q[15];
cx q[10], q[13];
