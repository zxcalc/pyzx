// Initial wiring: [8, 9, 14, 0, 10, 11, 6, 12, 2, 4, 3, 15, 5, 7, 13, 1]
// Resulting wiring: [8, 9, 14, 0, 10, 11, 6, 12, 2, 4, 3, 15, 5, 7, 13, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[10], q[9];
cx q[11], q[10];
cx q[10], q[9];
cx q[11], q[10];
cx q[14], q[9];
cx q[8], q[9];
