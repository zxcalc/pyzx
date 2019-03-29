// Initial wiring: [7, 2, 0, 14, 3, 4, 10, 6, 5, 11, 9, 12, 8, 15, 1, 13]
// Resulting wiring: [7, 2, 0, 14, 3, 4, 10, 6, 5, 11, 9, 12, 8, 15, 1, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[8], q[7];
cx q[7], q[6];
cx q[8], q[7];
cx q[10], q[5];
cx q[5], q[4];
cx q[10], q[5];
cx q[11], q[10];
cx q[10], q[9];
cx q[11], q[10];
cx q[15], q[14];
cx q[12], q[13];
cx q[13], q[14];
cx q[10], q[11];
cx q[8], q[9];
cx q[7], q[8];
cx q[5], q[6];
cx q[4], q[11];
cx q[2], q[3];
