// Initial wiring: [15, 8, 6, 9, 7, 0, 4, 3, 12, 11, 14, 2, 5, 1, 13, 10]
// Resulting wiring: [15, 8, 6, 9, 7, 0, 4, 3, 12, 11, 14, 2, 5, 1, 13, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[0];
cx q[4], q[1];
cx q[8], q[6];
cx q[11], q[10];
cx q[10], q[3];
cx q[9], q[4];
cx q[12], q[6];
cx q[13], q[12];
cx q[13], q[11];
cx q[15], q[11];
cx q[12], q[2];
cx q[14], q[15];
cx q[7], q[9];
cx q[0], q[12];
cx q[0], q[10];
cx q[4], q[6];
