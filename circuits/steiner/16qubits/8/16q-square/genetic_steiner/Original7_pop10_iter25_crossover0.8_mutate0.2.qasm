// Initial wiring: [1, 4, 5, 9, 14, 0, 6, 11, 3, 7, 8, 12, 15, 10, 13, 2]
// Resulting wiring: [1, 4, 5, 9, 14, 0, 6, 11, 3, 7, 8, 12, 15, 10, 13, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[9], q[6];
cx q[10], q[9];
cx q[10], q[5];
cx q[13], q[10];
cx q[10], q[9];
cx q[9], q[6];
cx q[13], q[10];
cx q[14], q[9];
cx q[15], q[8];
cx q[8], q[7];
cx q[15], q[8];
cx q[7], q[8];
cx q[8], q[9];
cx q[1], q[6];
