// Initial wiring: [7, 6, 3, 8, 10, 1, 0, 14, 9, 2, 12, 15, 13, 5, 4, 11]
// Resulting wiring: [7, 6, 3, 8, 10, 1, 0, 14, 9, 2, 12, 15, 13, 5, 4, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[5], q[4];
cx q[6], q[5];
cx q[7], q[0];
cx q[11], q[10];
cx q[10], q[9];
cx q[14], q[15];
cx q[8], q[9];
