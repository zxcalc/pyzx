// Initial wiring: [12, 1, 14, 7, 11, 15, 0, 8, 6, 13, 5, 9, 10, 4, 3, 2]
// Resulting wiring: [12, 1, 14, 7, 11, 15, 0, 8, 6, 13, 5, 9, 10, 4, 3, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[5], q[2];
cx q[11], q[10];
cx q[9], q[14];
