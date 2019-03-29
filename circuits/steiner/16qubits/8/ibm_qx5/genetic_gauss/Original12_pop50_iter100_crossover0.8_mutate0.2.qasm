// Initial wiring: [4, 9, 0, 10, 7, 12, 8, 2, 3, 11, 1, 5, 14, 15, 13, 6]
// Resulting wiring: [4, 9, 0, 10, 7, 12, 8, 2, 3, 11, 1, 5, 14, 15, 13, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[11], q[8];
cx q[11], q[5];
cx q[14], q[1];
cx q[0], q[2];
cx q[4], q[13];
cx q[0], q[12];
cx q[3], q[8];
