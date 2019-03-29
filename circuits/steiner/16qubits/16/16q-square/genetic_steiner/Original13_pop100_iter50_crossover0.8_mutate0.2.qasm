// Initial wiring: [0, 12, 1, 11, 2, 9, 14, 10, 13, 8, 4, 3, 7, 15, 5, 6]
// Resulting wiring: [0, 12, 1, 11, 2, 9, 14, 10, 13, 8, 4, 3, 7, 15, 5, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[6], q[5];
cx q[10], q[5];
cx q[11], q[10];
cx q[10], q[9];
cx q[10], q[5];
cx q[15], q[14];
cx q[11], q[12];
cx q[10], q[13];
cx q[13], q[12];
cx q[5], q[10];
cx q[10], q[13];
cx q[10], q[11];
cx q[2], q[3];
cx q[1], q[6];
cx q[0], q[7];
