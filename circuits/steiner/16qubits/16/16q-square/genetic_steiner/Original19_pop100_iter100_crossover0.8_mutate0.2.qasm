// Initial wiring: [14, 0, 4, 9, 3, 10, 13, 1, 15, 7, 2, 12, 11, 5, 6, 8]
// Resulting wiring: [14, 0, 4, 9, 3, 10, 13, 1, 15, 7, 2, 12, 11, 5, 6, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[10], q[9];
cx q[10], q[5];
cx q[13], q[12];
cx q[14], q[13];
cx q[13], q[10];
cx q[10], q[5];
cx q[5], q[4];
cx q[13], q[10];
cx q[15], q[8];
cx q[8], q[7];
cx q[6], q[7];
cx q[4], q[11];
cx q[3], q[4];
cx q[4], q[11];
cx q[11], q[12];
cx q[2], q[5];
cx q[5], q[4];
cx q[4], q[11];
