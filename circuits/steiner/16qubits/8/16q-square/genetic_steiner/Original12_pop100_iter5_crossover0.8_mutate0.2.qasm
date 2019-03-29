// Initial wiring: [10, 6, 3, 1, 12, 5, 14, 0, 4, 11, 15, 7, 2, 8, 9, 13]
// Resulting wiring: [10, 6, 3, 1, 12, 5, 14, 0, 4, 11, 15, 7, 2, 8, 9, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[5], q[4];
cx q[2], q[1];
cx q[7], q[6];
cx q[8], q[7];
cx q[7], q[6];
cx q[11], q[10];
cx q[15], q[14];
cx q[12], q[13];
cx q[1], q[2];
cx q[0], q[1];
cx q[1], q[2];
cx q[2], q[1];
