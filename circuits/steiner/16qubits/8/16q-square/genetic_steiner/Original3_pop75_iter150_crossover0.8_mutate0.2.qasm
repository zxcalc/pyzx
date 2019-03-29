// Initial wiring: [7, 5, 2, 15, 12, 8, 1, 6, 0, 4, 11, 10, 14, 9, 3, 13]
// Resulting wiring: [7, 5, 2, 15, 12, 8, 1, 6, 0, 4, 11, 10, 14, 9, 3, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[4], q[3];
cx q[9], q[8];
cx q[11], q[10];
cx q[10], q[5];
cx q[5], q[2];
cx q[10], q[5];
cx q[14], q[9];
cx q[8], q[15];
