// Initial wiring: [1, 3, 12, 11, 6, 14, 7, 10, 15, 8, 5, 13, 9, 0, 2, 4]
// Resulting wiring: [1, 3, 12, 11, 6, 14, 7, 10, 15, 8, 5, 13, 9, 0, 2, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[5];
cx q[5], q[4];
cx q[14], q[13];
cx q[10], q[13];
cx q[8], q[9];
cx q[6], q[7];
cx q[1], q[2];
cx q[2], q[5];
