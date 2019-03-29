// Initial wiring: [8, 9, 12, 2, 7, 10, 13, 5, 6, 15, 3, 0, 14, 4, 11, 1]
// Resulting wiring: [8, 9, 12, 2, 7, 10, 13, 5, 6, 15, 3, 0, 14, 4, 11, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[8];
cx q[11], q[10];
cx q[10], q[9];
cx q[9], q[8];
cx q[11], q[10];
cx q[14], q[13];
cx q[12], q[13];
cx q[10], q[11];
cx q[7], q[8];
cx q[8], q[9];
cx q[4], q[11];
cx q[2], q[3];
