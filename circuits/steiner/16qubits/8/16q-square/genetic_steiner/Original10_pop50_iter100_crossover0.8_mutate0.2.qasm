// Initial wiring: [1, 11, 4, 14, 15, 5, 6, 2, 12, 0, 3, 8, 9, 10, 7, 13]
// Resulting wiring: [1, 11, 4, 14, 15, 5, 6, 2, 12, 0, 3, 8, 9, 10, 7, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[6], q[5];
cx q[5], q[4];
cx q[6], q[5];
cx q[8], q[7];
cx q[10], q[9];
cx q[9], q[6];
cx q[14], q[9];
cx q[5], q[6];
cx q[1], q[2];
