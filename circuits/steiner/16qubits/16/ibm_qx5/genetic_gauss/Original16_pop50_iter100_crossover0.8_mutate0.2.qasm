// Initial wiring: [13, 4, 8, 6, 9, 10, 2, 0, 14, 12, 5, 7, 11, 15, 1, 3]
// Resulting wiring: [13, 4, 8, 6, 9, 10, 2, 0, 14, 12, 5, 7, 11, 15, 1, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[1];
cx q[8], q[0];
cx q[11], q[1];
cx q[8], q[5];
cx q[12], q[9];
cx q[13], q[7];
cx q[14], q[12];
cx q[14], q[7];
cx q[12], q[0];
cx q[4], q[13];
cx q[3], q[4];
cx q[1], q[7];
cx q[0], q[1];
cx q[13], q[15];
cx q[3], q[14];
