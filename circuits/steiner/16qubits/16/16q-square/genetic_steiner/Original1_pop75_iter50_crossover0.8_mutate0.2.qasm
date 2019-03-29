// Initial wiring: [13, 6, 9, 14, 4, 12, 15, 10, 11, 8, 3, 0, 5, 7, 2, 1]
// Resulting wiring: [13, 6, 9, 14, 4, 12, 15, 10, 11, 8, 3, 0, 5, 7, 2, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[6], q[1];
cx q[8], q[7];
cx q[12], q[11];
cx q[8], q[15];
cx q[7], q[8];
cx q[8], q[15];
cx q[15], q[8];
cx q[6], q[9];
cx q[9], q[14];
cx q[9], q[10];
cx q[5], q[10];
cx q[4], q[5];
cx q[5], q[10];
cx q[10], q[13];
cx q[5], q[6];
cx q[2], q[3];
