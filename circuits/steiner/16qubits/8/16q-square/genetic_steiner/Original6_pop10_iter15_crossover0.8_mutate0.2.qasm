// Initial wiring: [10, 7, 2, 3, 13, 14, 8, 0, 6, 1, 12, 9, 4, 5, 11, 15]
// Resulting wiring: [10, 7, 2, 3, 13, 14, 8, 0, 6, 1, 12, 9, 4, 5, 11, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[4], q[3];
cx q[3], q[2];
cx q[4], q[3];
cx q[5], q[2];
cx q[7], q[0];
cx q[13], q[10];
cx q[15], q[8];
cx q[8], q[7];
cx q[8], q[15];
cx q[15], q[14];
cx q[7], q[8];
cx q[4], q[11];
cx q[0], q[7];
cx q[7], q[8];
cx q[8], q[15];
cx q[8], q[7];
