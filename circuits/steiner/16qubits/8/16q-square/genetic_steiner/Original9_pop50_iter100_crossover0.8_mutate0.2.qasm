// Initial wiring: [0, 11, 4, 5, 3, 7, 9, 12, 6, 10, 13, 1, 15, 2, 8, 14]
// Resulting wiring: [0, 11, 4, 5, 3, 7, 9, 12, 6, 10, 13, 1, 15, 2, 8, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[9], q[8];
cx q[12], q[11];
cx q[11], q[4];
cx q[14], q[13];
cx q[14], q[9];
cx q[7], q[8];
cx q[8], q[15];
