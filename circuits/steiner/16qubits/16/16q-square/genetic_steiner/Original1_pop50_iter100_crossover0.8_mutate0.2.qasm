// Initial wiring: [10, 11, 9, 14, 4, 3, 7, 1, 13, 2, 8, 15, 12, 6, 0, 5]
// Resulting wiring: [10, 11, 9, 14, 4, 3, 7, 1, 13, 2, 8, 15, 12, 6, 0, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[4], q[3];
cx q[6], q[1];
cx q[7], q[6];
cx q[6], q[1];
cx q[7], q[6];
cx q[11], q[10];
cx q[10], q[9];
cx q[10], q[5];
cx q[12], q[11];
cx q[15], q[14];
cx q[11], q[12];
cx q[12], q[13];
cx q[4], q[11];
cx q[4], q[5];
cx q[11], q[12];
cx q[5], q[6];
cx q[2], q[3];
cx q[0], q[7];
