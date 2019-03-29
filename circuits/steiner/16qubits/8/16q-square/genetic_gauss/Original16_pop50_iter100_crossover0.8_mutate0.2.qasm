// Initial wiring: [8, 1, 5, 15, 14, 10, 11, 12, 7, 0, 2, 13, 4, 6, 3, 9]
// Resulting wiring: [8, 1, 5, 15, 14, 10, 11, 12, 7, 0, 2, 13, 4, 6, 3, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[6];
cx q[9], q[4];
cx q[10], q[4];
cx q[4], q[2];
cx q[6], q[9];
cx q[6], q[7];
cx q[8], q[13];
cx q[10], q[12];
