// Initial wiring: [10, 2, 7, 15, 12, 11, 6, 13, 9, 5, 1, 4, 0, 8, 14, 3]
// Resulting wiring: [10, 2, 7, 15, 12, 11, 6, 13, 9, 5, 1, 4, 0, 8, 14, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[4], q[3];
cx q[5], q[2];
cx q[2], q[1];
cx q[6], q[1];
cx q[10], q[9];
cx q[13], q[10];
cx q[10], q[9];
cx q[9], q[8];
cx q[13], q[10];
cx q[14], q[15];
cx q[10], q[11];
cx q[11], q[12];
cx q[12], q[11];
cx q[7], q[8];
cx q[5], q[10];
cx q[10], q[11];
cx q[10], q[9];
cx q[11], q[12];
cx q[9], q[8];
cx q[12], q[11];
cx q[4], q[11];
cx q[11], q[12];
cx q[0], q[1];
