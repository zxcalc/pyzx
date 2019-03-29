// Initial wiring: [1, 9, 3, 6, 15, 13, 14, 0, 5, 2, 10, 7, 11, 8, 12, 4]
// Resulting wiring: [1, 9, 3, 6, 15, 13, 14, 0, 5, 2, 10, 7, 11, 8, 12, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[11];
cx q[11], q[10];
cx q[12], q[13];
cx q[9], q[10];
cx q[3], q[12];
cx q[12], q[13];
cx q[2], q[13];
cx q[13], q[14];
