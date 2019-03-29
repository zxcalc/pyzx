// Initial wiring: [9, 15, 4, 11, 2, 8, 1, 14, 3, 6, 10, 12, 7, 5, 13, 0]
// Resulting wiring: [9, 15, 4, 11, 2, 8, 1, 14, 3, 6, 10, 12, 7, 5, 13, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[11], q[10];
cx q[10], q[9];
cx q[9], q[8];
cx q[8], q[7];
cx q[9], q[8];
cx q[11], q[10];
cx q[13], q[10];
cx q[10], q[9];
cx q[10], q[13];
cx q[9], q[10];
cx q[8], q[9];
cx q[9], q[10];
cx q[10], q[13];
cx q[10], q[9];
cx q[13], q[10];
cx q[7], q[8];
cx q[5], q[10];
cx q[1], q[6];
cx q[6], q[7];
cx q[7], q[8];
cx q[8], q[7];
