// Initial wiring: [10, 11, 6, 5, 3, 14, 12, 8, 9, 1, 15, 2, 4, 0, 7, 13]
// Resulting wiring: [10, 11, 6, 5, 3, 14, 12, 8, 9, 1, 15, 2, 4, 0, 7, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[10], q[9];
cx q[11], q[10];
cx q[10], q[9];
cx q[9], q[6];
cx q[11], q[10];
cx q[15], q[8];
cx q[13], q[14];
cx q[6], q[9];
cx q[9], q[8];
cx q[5], q[6];
cx q[6], q[9];
cx q[1], q[2];
