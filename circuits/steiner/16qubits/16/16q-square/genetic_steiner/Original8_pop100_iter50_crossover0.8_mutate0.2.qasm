// Initial wiring: [14, 12, 10, 8, 2, 3, 0, 13, 15, 11, 9, 4, 1, 5, 7, 6]
// Resulting wiring: [14, 12, 10, 8, 2, 3, 0, 13, 15, 11, 9, 4, 1, 5, 7, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[4], q[3];
cx q[7], q[6];
cx q[12], q[11];
cx q[14], q[13];
cx q[12], q[13];
cx q[13], q[14];
cx q[10], q[13];
cx q[13], q[14];
cx q[5], q[10];
cx q[10], q[9];
cx q[9], q[8];
cx q[8], q[15];
cx q[10], q[11];
cx q[2], q[5];
cx q[5], q[10];
cx q[10], q[11];
cx q[10], q[9];
cx q[0], q[7];
cx q[7], q[8];
cx q[8], q[15];
