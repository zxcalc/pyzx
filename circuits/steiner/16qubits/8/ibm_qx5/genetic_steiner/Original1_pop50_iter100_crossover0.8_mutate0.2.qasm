// Initial wiring: [7, 0, 6, 11, 9, 12, 1, 2, 10, 14, 3, 13, 4, 5, 8, 15]
// Resulting wiring: [7, 0, 6, 11, 9, 12, 1, 2, 10, 14, 3, 13, 4, 5, 8, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[3], q[2];
cx q[5], q[4];
cx q[7], q[6];
cx q[9], q[6];
cx q[6], q[5];
cx q[11], q[4];
cx q[9], q[10];
