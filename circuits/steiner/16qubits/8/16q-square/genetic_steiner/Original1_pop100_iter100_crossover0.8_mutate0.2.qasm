// Initial wiring: [5, 11, 7, 0, 15, 4, 6, 3, 14, 1, 12, 8, 13, 9, 2, 10]
// Resulting wiring: [5, 11, 7, 0, 15, 4, 6, 3, 14, 1, 12, 8, 13, 9, 2, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[8], q[7];
cx q[14], q[9];
cx q[12], q[13];
cx q[10], q[13];
cx q[8], q[9];
cx q[9], q[10];
cx q[1], q[6];
