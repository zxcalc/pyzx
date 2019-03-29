// Initial wiring: [14, 12, 5, 15, 1, 3, 6, 11, 9, 10, 8, 2, 4, 7, 0, 13]
// Resulting wiring: [14, 12, 5, 15, 1, 3, 6, 11, 9, 10, 8, 2, 4, 7, 0, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[9], q[6];
cx q[6], q[1];
cx q[1], q[0];
cx q[6], q[1];
cx q[10], q[9];
cx q[10], q[11];
cx q[3], q[4];
cx q[4], q[5];
cx q[1], q[6];
