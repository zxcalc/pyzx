// Initial wiring: [2, 6, 1, 9, 13, 4, 10, 14, 11, 7, 8, 12, 3, 15, 5, 0]
// Resulting wiring: [2, 6, 1, 9, 13, 4, 10, 14, 11, 7, 8, 12, 3, 15, 5, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[10], q[5];
cx q[15], q[8];
cx q[8], q[7];
cx q[10], q[13];
cx q[10], q[11];
cx q[1], q[2];
cx q[2], q[3];
