// Initial wiring: [0, 6, 2, 13, 10, 7, 9, 1, 8, 15, 11, 3, 5, 12, 14, 4]
// Resulting wiring: [0, 6, 2, 13, 10, 7, 9, 1, 8, 15, 11, 3, 5, 12, 14, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[8];
cx q[13], q[10];
cx q[10], q[9];
cx q[9], q[8];
cx q[10], q[5];
cx q[14], q[13];
cx q[15], q[8];
cx q[14], q[15];
cx q[7], q[8];
