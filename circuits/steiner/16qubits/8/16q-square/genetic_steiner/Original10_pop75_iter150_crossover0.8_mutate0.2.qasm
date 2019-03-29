// Initial wiring: [9, 13, 8, 10, 3, 5, 1, 11, 4, 14, 6, 0, 7, 15, 2, 12]
// Resulting wiring: [9, 13, 8, 10, 3, 5, 1, 11, 4, 14, 6, 0, 7, 15, 2, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[8];
cx q[11], q[10];
cx q[12], q[11];
cx q[11], q[10];
cx q[15], q[14];
cx q[12], q[13];
cx q[7], q[8];
cx q[5], q[10];
cx q[10], q[13];
cx q[4], q[11];
cx q[11], q[10];
