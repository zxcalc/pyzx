// Initial wiring: [5, 3, 13, 15, 8, 9, 14, 0, 7, 1, 12, 6, 11, 10, 2, 4]
// Resulting wiring: [5, 3, 13, 15, 8, 9, 14, 0, 7, 1, 12, 6, 11, 10, 2, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[10], q[5];
cx q[12], q[11];
cx q[14], q[9];
cx q[7], q[8];
cx q[6], q[9];
cx q[9], q[10];
cx q[2], q[5];
