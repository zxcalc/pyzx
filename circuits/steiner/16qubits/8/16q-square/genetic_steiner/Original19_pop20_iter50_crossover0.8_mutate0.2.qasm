// Initial wiring: [15, 11, 7, 0, 2, 1, 8, 5, 3, 12, 4, 14, 9, 13, 6, 10]
// Resulting wiring: [15, 11, 7, 0, 2, 1, 8, 5, 3, 12, 4, 14, 9, 13, 6, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[9], q[6];
cx q[6], q[1];
cx q[1], q[0];
cx q[10], q[9];
cx q[9], q[6];
cx q[11], q[10];
cx q[10], q[9];
cx q[5], q[6];
cx q[1], q[6];
cx q[1], q[2];
