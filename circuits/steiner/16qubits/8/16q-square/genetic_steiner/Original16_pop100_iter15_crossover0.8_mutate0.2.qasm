// Initial wiring: [12, 11, 7, 6, 15, 1, 0, 10, 8, 14, 4, 2, 13, 3, 5, 9]
// Resulting wiring: [12, 11, 7, 6, 15, 1, 0, 10, 8, 14, 4, 2, 13, 3, 5, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[1], q[0];
cx q[10], q[9];
cx q[11], q[10];
cx q[10], q[9];
cx q[6], q[9];
cx q[9], q[14];
cx q[2], q[3];
cx q[1], q[6];
