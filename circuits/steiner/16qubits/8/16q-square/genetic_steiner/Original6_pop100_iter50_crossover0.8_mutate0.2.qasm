// Initial wiring: [9, 13, 2, 14, 1, 4, 7, 12, 5, 0, 10, 15, 6, 11, 8, 3]
// Resulting wiring: [9, 13, 2, 14, 1, 4, 7, 12, 5, 0, 10, 15, 6, 11, 8, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[3], q[2];
cx q[8], q[7];
cx q[12], q[13];
cx q[9], q[10];
cx q[10], q[11];
cx q[11], q[12];
cx q[1], q[2];
