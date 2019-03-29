// Initial wiring: [9, 14, 7, 13, 12, 3, 4, 2, 11, 6, 8, 15, 5, 0, 1, 10]
// Resulting wiring: [9, 14, 7, 13, 12, 3, 4, 2, 11, 6, 8, 15, 5, 0, 1, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[6], q[5];
cx q[5], q[4];
cx q[6], q[1];
cx q[10], q[9];
cx q[9], q[8];
cx q[8], q[7];
cx q[9], q[8];
cx q[11], q[10];
cx q[10], q[9];
cx q[9], q[8];
cx q[10], q[5];
cx q[8], q[7];
cx q[5], q[2];
cx q[14], q[9];
cx q[9], q[8];
cx q[14], q[9];
cx q[14], q[15];
cx q[12], q[13];
cx q[8], q[15];
cx q[15], q[14];
cx q[4], q[11];
cx q[0], q[1];
