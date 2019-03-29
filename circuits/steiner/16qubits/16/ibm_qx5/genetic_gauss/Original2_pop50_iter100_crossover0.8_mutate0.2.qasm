// Initial wiring: [15, 6, 4, 8, 11, 14, 10, 1, 5, 3, 9, 2, 7, 13, 12, 0]
// Resulting wiring: [15, 6, 4, 8, 11, 14, 10, 1, 5, 3, 9, 2, 7, 13, 12, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[0];
cx q[10], q[8];
cx q[9], q[4];
cx q[9], q[5];
cx q[13], q[3];
cx q[15], q[6];
cx q[12], q[10];
cx q[11], q[15];
cx q[6], q[11];
cx q[11], q[13];
cx q[3], q[15];
cx q[0], q[15];
cx q[0], q[14];
cx q[4], q[13];
cx q[2], q[12];
cx q[2], q[6];
