// Initial wiring: [9, 6, 2, 7, 14, 12, 11, 0, 15, 4, 1, 5, 8, 10, 13, 3]
// Resulting wiring: [9, 6, 2, 7, 14, 12, 11, 0, 15, 4, 1, 5, 8, 10, 13, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[8], q[7];
cx q[10], q[9];
cx q[14], q[9];
cx q[14], q[15];
cx q[12], q[13];
cx q[3], q[4];
cx q[2], q[3];
cx q[3], q[4];
