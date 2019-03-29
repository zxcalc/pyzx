// Initial wiring: [8, 11, 5, 14, 15, 9, 6, 13, 4, 1, 2, 7, 12, 3, 0, 10]
// Resulting wiring: [8, 11, 5, 14, 15, 9, 6, 13, 4, 1, 2, 7, 12, 3, 0, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[5], q[2];
cx q[9], q[6];
cx q[11], q[10];
cx q[10], q[9];
cx q[9], q[8];
cx q[15], q[14];
cx q[6], q[7];
