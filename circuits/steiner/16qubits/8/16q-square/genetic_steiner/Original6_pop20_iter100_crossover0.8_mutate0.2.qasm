// Initial wiring: [12, 5, 14, 2, 9, 1, 3, 4, 10, 15, 6, 13, 8, 11, 7, 0]
// Resulting wiring: [12, 5, 14, 2, 9, 1, 3, 4, 10, 15, 6, 13, 8, 11, 7, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[4], q[3];
cx q[11], q[4];
cx q[4], q[3];
cx q[15], q[8];
cx q[10], q[13];
cx q[8], q[9];
cx q[9], q[10];
cx q[2], q[3];
