// Initial wiring: [8, 3, 5, 12, 11, 0, 9, 2, 14, 6, 15, 1, 4, 13, 7, 10]
// Resulting wiring: [8, 3, 5, 12, 11, 0, 9, 2, 14, 6, 15, 1, 4, 13, 7, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[7], q[6];
cx q[8], q[7];
cx q[9], q[6];
cx q[11], q[4];
cx q[14], q[13];
cx q[4], q[5];
cx q[2], q[5];
cx q[0], q[1];
