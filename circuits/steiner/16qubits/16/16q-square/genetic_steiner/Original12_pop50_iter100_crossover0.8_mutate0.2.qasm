// Initial wiring: [6, 10, 4, 5, 12, 14, 9, 13, 7, 3, 11, 2, 15, 8, 0, 1]
// Resulting wiring: [6, 10, 4, 5, 12, 14, 9, 13, 7, 3, 11, 2, 15, 8, 0, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[7], q[6];
cx q[6], q[5];
cx q[5], q[4];
cx q[8], q[7];
cx q[9], q[6];
cx q[6], q[5];
cx q[10], q[9];
cx q[11], q[10];
cx q[12], q[11];
cx q[11], q[10];
cx q[10], q[9];
cx q[9], q[6];
cx q[13], q[10];
cx q[10], q[9];
cx q[9], q[8];
cx q[8], q[7];
cx q[10], q[9];
cx q[14], q[15];
cx q[10], q[11];
cx q[9], q[10];
cx q[10], q[11];
cx q[6], q[9];
cx q[2], q[3];
