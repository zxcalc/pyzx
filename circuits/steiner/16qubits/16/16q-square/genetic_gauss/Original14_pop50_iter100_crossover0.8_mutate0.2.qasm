// Initial wiring: [6, 0, 4, 14, 1, 13, 15, 10, 8, 9, 7, 2, 12, 11, 5, 3]
// Resulting wiring: [6, 0, 4, 14, 1, 13, 15, 10, 8, 9, 7, 2, 12, 11, 5, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[3];
cx q[7], q[6];
cx q[6], q[1];
cx q[12], q[5];
cx q[13], q[12];
cx q[12], q[1];
cx q[15], q[3];
cx q[13], q[4];
cx q[13], q[6];
cx q[14], q[11];
cx q[11], q[15];
cx q[2], q[3];
cx q[2], q[11];
cx q[0], q[9];
cx q[5], q[6];
