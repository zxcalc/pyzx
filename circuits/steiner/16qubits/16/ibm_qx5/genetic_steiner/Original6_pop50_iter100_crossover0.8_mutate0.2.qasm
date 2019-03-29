// Initial wiring: [8, 12, 7, 15, 14, 6, 3, 10, 4, 2, 13, 11, 5, 0, 1, 9]
// Resulting wiring: [8, 12, 7, 15, 14, 6, 3, 10, 4, 2, 13, 11, 5, 0, 1, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[2], q[1];
cx q[1], q[0];
cx q[2], q[1];
cx q[6], q[5];
cx q[5], q[4];
cx q[10], q[5];
cx q[5], q[4];
cx q[11], q[10];
cx q[10], q[9];
cx q[10], q[5];
cx q[14], q[13];
cx q[15], q[0];
cx q[13], q[14];
cx q[11], q[12];
cx q[9], q[10];
cx q[6], q[7];
