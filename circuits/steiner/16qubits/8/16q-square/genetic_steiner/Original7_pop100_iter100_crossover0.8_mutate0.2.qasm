// Initial wiring: [15, 9, 14, 13, 7, 3, 11, 2, 5, 4, 6, 10, 1, 12, 8, 0]
// Resulting wiring: [15, 9, 14, 13, 7, 3, 11, 2, 5, 4, 6, 10, 1, 12, 8, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[6], q[5];
cx q[5], q[4];
cx q[11], q[10];
cx q[11], q[4];
cx q[14], q[15];
cx q[9], q[10];
cx q[3], q[4];
