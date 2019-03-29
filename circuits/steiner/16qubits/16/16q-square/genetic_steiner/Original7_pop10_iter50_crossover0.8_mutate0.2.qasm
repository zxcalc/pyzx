// Initial wiring: [0, 6, 2, 12, 4, 13, 3, 5, 15, 11, 10, 1, 14, 9, 8, 7]
// Resulting wiring: [0, 6, 2, 12, 4, 13, 3, 5, 15, 11, 10, 1, 14, 9, 8, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[6], q[5];
cx q[7], q[6];
cx q[6], q[5];
cx q[6], q[1];
cx q[8], q[7];
cx q[9], q[8];
cx q[9], q[6];
cx q[10], q[9];
cx q[9], q[8];
cx q[9], q[6];
cx q[11], q[10];
cx q[10], q[5];
cx q[11], q[10];
cx q[13], q[10];
cx q[10], q[9];
cx q[13], q[10];
cx q[15], q[8];
cx q[8], q[7];
cx q[7], q[6];
cx q[14], q[15];
cx q[10], q[11];
cx q[9], q[14];
cx q[6], q[7];
