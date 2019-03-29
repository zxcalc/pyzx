// Initial wiring: [5, 15, 1, 6, 12, 4, 0, 14, 2, 11, 13, 3, 9, 10, 8, 7]
// Resulting wiring: [5, 15, 1, 6, 12, 4, 0, 14, 2, 11, 13, 3, 9, 10, 8, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[10], q[5];
cx q[14], q[13];
cx q[10], q[11];
cx q[8], q[15];
cx q[6], q[9];
cx q[2], q[5];
cx q[1], q[6];
