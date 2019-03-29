// Initial wiring: [11, 6, 10, 5, 12, 14, 0, 4, 1, 2, 7, 3, 8, 15, 9, 13]
// Resulting wiring: [11, 6, 10, 5, 12, 14, 0, 4, 1, 2, 7, 3, 8, 15, 9, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[11], q[9];
cx q[11], q[0];
cx q[7], q[3];
cx q[11], q[5];
cx q[14], q[2];
cx q[15], q[14];
cx q[12], q[0];
cx q[14], q[4];
cx q[14], q[11];
cx q[13], q[14];
cx q[6], q[8];
cx q[0], q[15];
cx q[0], q[10];
