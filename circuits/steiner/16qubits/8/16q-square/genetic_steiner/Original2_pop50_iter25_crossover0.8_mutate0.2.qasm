// Initial wiring: [10, 1, 0, 6, 3, 14, 7, 15, 12, 2, 9, 5, 8, 11, 4, 13]
// Resulting wiring: [10, 1, 0, 6, 3, 14, 7, 15, 12, 2, 9, 5, 8, 11, 4, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[2], q[1];
cx q[4], q[3];
cx q[10], q[9];
cx q[14], q[13];
cx q[7], q[8];
cx q[8], q[9];
cx q[5], q[6];
