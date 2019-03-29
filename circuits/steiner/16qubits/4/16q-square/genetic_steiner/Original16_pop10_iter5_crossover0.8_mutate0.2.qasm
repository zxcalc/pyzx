// Initial wiring: [1, 2, 10, 9, 3, 15, 12, 4, 11, 8, 6, 0, 5, 14, 7, 13]
// Resulting wiring: [1, 2, 10, 9, 3, 15, 12, 4, 11, 8, 6, 0, 5, 14, 7, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[10];
cx q[14], q[13];
cx q[13], q[10];
cx q[14], q[13];
cx q[15], q[8];
cx q[4], q[5];
cx q[0], q[1];
