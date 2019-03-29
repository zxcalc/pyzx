// Initial wiring: [4, 1, 7, 3, 14, 2, 13, 9, 5, 6, 8, 11, 10, 0, 15, 12]
// Resulting wiring: [4, 1, 7, 3, 14, 2, 13, 9, 5, 6, 8, 11, 10, 0, 15, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[2], q[1];
cx q[1], q[0];
cx q[5], q[2];
cx q[9], q[6];
cx q[11], q[10];
cx q[12], q[13];
cx q[7], q[8];
cx q[6], q[9];
cx q[2], q[5];
cx q[5], q[6];
cx q[1], q[6];
cx q[6], q[9];
