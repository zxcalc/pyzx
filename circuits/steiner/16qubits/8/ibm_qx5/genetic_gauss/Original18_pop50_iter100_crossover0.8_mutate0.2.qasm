// Initial wiring: [3, 9, 7, 10, 8, 4, 6, 13, 0, 5, 15, 12, 1, 2, 14, 11]
// Resulting wiring: [3, 9, 7, 10, 8, 4, 6, 13, 0, 5, 15, 12, 1, 2, 14, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[0];
cx q[12], q[13];
cx q[10], q[15];
cx q[8], q[14];
cx q[8], q[12];
cx q[0], q[5];
cx q[0], q[10];
cx q[3], q[7];
