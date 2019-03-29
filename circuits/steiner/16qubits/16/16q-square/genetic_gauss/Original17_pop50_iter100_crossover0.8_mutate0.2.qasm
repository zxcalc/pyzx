// Initial wiring: [12, 15, 1, 13, 2, 14, 11, 7, 0, 4, 9, 3, 5, 10, 6, 8]
// Resulting wiring: [12, 15, 1, 13, 2, 14, 11, 7, 0, 4, 9, 3, 5, 10, 6, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[2];
cx q[6], q[4];
cx q[13], q[4];
cx q[14], q[4];
cx q[15], q[12];
cx q[6], q[9];
cx q[6], q[7];
cx q[3], q[10];
cx q[2], q[10];
cx q[2], q[8];
cx q[0], q[8];
cx q[0], q[1];
cx q[2], q[12];
cx q[5], q[11];
cx q[8], q[9];
