// Initial wiring: [2, 15, 4, 11, 8, 14, 7, 1, 10, 5, 13, 6, 0, 9, 12, 3]
// Resulting wiring: [2, 15, 4, 11, 8, 14, 7, 1, 10, 5, 13, 6, 0, 9, 12, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[7], q[6];
cx q[11], q[10];
cx q[15], q[4];
cx q[8], q[11];
cx q[11], q[15];
cx q[6], q[14];
cx q[0], q[11];
