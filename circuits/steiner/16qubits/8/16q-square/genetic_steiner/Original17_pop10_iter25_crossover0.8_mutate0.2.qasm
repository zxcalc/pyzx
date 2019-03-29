// Initial wiring: [10, 5, 4, 13, 7, 1, 6, 2, 0, 15, 12, 8, 3, 9, 14, 11]
// Resulting wiring: [10, 5, 4, 13, 7, 1, 6, 2, 0, 15, 12, 8, 3, 9, 14, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[5], q[2];
cx q[10], q[9];
cx q[10], q[5];
cx q[11], q[10];
cx q[10], q[5];
cx q[10], q[9];
cx q[5], q[2];
cx q[13], q[10];
cx q[10], q[13];
cx q[8], q[15];
cx q[15], q[14];
cx q[2], q[5];
cx q[5], q[10];
cx q[10], q[13];
cx q[13], q[10];
