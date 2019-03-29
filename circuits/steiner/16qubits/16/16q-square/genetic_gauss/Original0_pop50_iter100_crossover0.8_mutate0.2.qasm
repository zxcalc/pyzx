// Initial wiring: [3, 10, 8, 2, 6, 14, 0, 5, 15, 12, 13, 7, 9, 1, 4, 11]
// Resulting wiring: [3, 10, 8, 2, 6, 14, 0, 5, 15, 12, 13, 7, 9, 1, 4, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[1];
cx q[11], q[1];
cx q[10], q[0];
cx q[11], q[2];
cx q[9], q[5];
cx q[15], q[14];
cx q[13], q[1];
cx q[15], q[5];
cx q[10], q[12];
cx q[9], q[12];
cx q[5], q[13];
cx q[4], q[12];
cx q[3], q[10];
cx q[3], q[9];
