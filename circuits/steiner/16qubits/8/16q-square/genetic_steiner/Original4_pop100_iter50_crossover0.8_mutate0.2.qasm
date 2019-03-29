// Initial wiring: [1, 15, 10, 0, 11, 14, 12, 13, 9, 2, 5, 4, 7, 3, 8, 6]
// Resulting wiring: [1, 15, 10, 0, 11, 14, 12, 13, 9, 2, 5, 4, 7, 3, 8, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[4], q[3];
cx q[9], q[8];
cx q[11], q[10];
cx q[14], q[9];
cx q[9], q[10];
cx q[8], q[9];
cx q[1], q[2];
