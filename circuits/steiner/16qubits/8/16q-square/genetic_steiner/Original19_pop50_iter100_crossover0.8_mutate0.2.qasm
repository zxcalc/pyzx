// Initial wiring: [0, 2, 10, 5, 9, 15, 6, 13, 14, 4, 8, 1, 7, 11, 12, 3]
// Resulting wiring: [0, 2, 10, 5, 9, 15, 6, 13, 14, 4, 8, 1, 7, 11, 12, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[10];
cx q[10], q[5];
cx q[14], q[13];
cx q[13], q[10];
cx q[13], q[12];
cx q[10], q[5];
cx q[9], q[14];
cx q[9], q[10];
cx q[8], q[9];
cx q[9], q[14];
