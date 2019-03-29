// Initial wiring: [8, 0, 3, 11, 2, 7, 13, 5, 9, 6, 10, 14, 1, 15, 4, 12]
// Resulting wiring: [8, 0, 3, 11, 2, 7, 13, 5, 9, 6, 10, 14, 1, 15, 4, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[3], q[2];
cx q[6], q[5];
cx q[10], q[9];
cx q[10], q[5];
cx q[14], q[9];
cx q[2], q[5];
cx q[0], q[1];
