// Initial wiring: [7, 10, 5, 12, 2, 15, 6, 0, 3, 4, 14, 8, 9, 1, 11, 13]
// Resulting wiring: [7, 10, 5, 12, 2, 15, 6, 0, 3, 4, 14, 8, 9, 1, 11, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[8], q[7];
cx q[7], q[6];
cx q[10], q[9];
cx q[14], q[9];
cx q[5], q[6];
cx q[3], q[4];
cx q[2], q[5];
cx q[5], q[6];
cx q[0], q[7];
