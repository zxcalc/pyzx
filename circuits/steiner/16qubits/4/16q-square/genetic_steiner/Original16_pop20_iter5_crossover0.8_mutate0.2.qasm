// Initial wiring: [12, 10, 2, 6, 7, 5, 14, 3, 15, 4, 1, 8, 9, 11, 13, 0]
// Resulting wiring: [12, 10, 2, 6, 7, 5, 14, 3, 15, 4, 1, 8, 9, 11, 13, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[5], q[2];
cx q[10], q[5];
cx q[5], q[2];
cx q[10], q[5];
cx q[14], q[13];
cx q[7], q[8];
