// Initial wiring: [12, 11, 7, 6, 13, 14, 0, 10, 4, 2, 5, 9, 3, 8, 15, 1]
// Resulting wiring: [12, 11, 7, 6, 13, 14, 0, 10, 4, 2, 5, 9, 3, 8, 15, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[1], q[0];
cx q[9], q[6];
cx q[6], q[5];
cx q[9], q[8];
cx q[9], q[6];
cx q[5], q[10];
cx q[2], q[3];
cx q[1], q[6];
