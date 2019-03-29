// Initial wiring: [10, 4, 0, 13, 6, 12, 9, 1, 3, 2, 5, 8, 14, 7, 11, 15]
// Resulting wiring: [10, 4, 0, 13, 6, 12, 9, 1, 3, 2, 5, 8, 14, 7, 11, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[7];
cx q[9], q[3];
cx q[11], q[9];
cx q[8], q[0];
cx q[3], q[1];
cx q[12], q[4];
cx q[14], q[4];
cx q[14], q[3];
cx q[15], q[14];
cx q[15], q[8];
cx q[5], q[8];
cx q[3], q[15];
cx q[2], q[8];
cx q[0], q[8];
cx q[0], q[4];
cx q[0], q[3];
cx q[1], q[11];
