// Initial wiring: [8, 9, 2, 13, 0, 6, 5, 4, 14, 12, 7, 11, 3, 1, 10, 15]
// Resulting wiring: [8, 9, 2, 13, 0, 6, 5, 4, 14, 12, 7, 11, 3, 1, 10, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[11], q[4];
cx q[14], q[13];
cx q[15], q[14];
cx q[14], q[13];
cx q[1], q[2];
cx q[2], q[1];
cx q[0], q[1];
cx q[1], q[6];
cx q[1], q[2];
cx q[2], q[1];
