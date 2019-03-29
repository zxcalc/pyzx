// Initial wiring: [5, 15, 9, 12, 6, 19, 13, 17, 8, 7, 2, 18, 10, 11, 0, 14, 3, 4, 1, 16]
// Resulting wiring: [5, 15, 9, 12, 6, 19, 13, 17, 8, 7, 2, 18, 10, 11, 0, 14, 3, 4, 1, 16]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[1];
cx q[11], q[8];
cx q[12], q[6];
cx q[13], q[6];
cx q[6], q[4];
cx q[5], q[6];
cx q[0], q[1];
