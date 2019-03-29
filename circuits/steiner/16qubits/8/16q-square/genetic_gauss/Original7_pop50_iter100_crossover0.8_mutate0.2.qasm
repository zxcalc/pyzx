// Initial wiring: [14, 9, 11, 3, 8, 2, 5, 15, 7, 0, 6, 4, 1, 12, 10, 13]
// Resulting wiring: [14, 9, 11, 3, 8, 2, 5, 15, 7, 0, 6, 4, 1, 12, 10, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[11], q[10];
cx q[14], q[8];
cx q[15], q[8];
cx q[14], q[10];
cx q[2], q[3];
cx q[4], q[9];
cx q[3], q[8];
