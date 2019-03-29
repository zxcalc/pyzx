// Initial wiring: [10, 12, 8, 5, 6, 1, 2, 3, 14, 13, 4, 7, 0, 15, 11, 9]
// Resulting wiring: [10, 12, 8, 5, 6, 1, 2, 3, 14, 13, 4, 7, 0, 15, 11, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[11], q[6];
cx q[6], q[5];
cx q[14], q[2];
cx q[15], q[3];
cx q[0], q[12];
cx q[5], q[10];
cx q[4], q[9];
