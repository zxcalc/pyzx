// Initial wiring: [8, 4, 12, 11, 2, 10, 1, 5, 15, 9, 3, 6, 7, 14, 13, 0]
// Resulting wiring: [8, 4, 12, 11, 2, 10, 1, 5, 15, 9, 3, 6, 7, 14, 13, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[6];
cx q[15], q[3];
cx q[1], q[6];
cx q[0], q[2];
cx q[0], q[1];
cx q[3], q[13];
cx q[6], q[9];
cx q[0], q[8];
