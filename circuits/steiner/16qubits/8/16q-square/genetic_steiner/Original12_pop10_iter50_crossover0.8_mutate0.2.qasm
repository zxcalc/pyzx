// Initial wiring: [3, 5, 10, 0, 4, 11, 1, 12, 15, 7, 9, 14, 6, 13, 8, 2]
// Resulting wiring: [3, 5, 10, 0, 4, 11, 1, 12, 15, 7, 9, 14, 6, 13, 8, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[1], q[0];
cx q[2], q[1];
cx q[4], q[3];
cx q[7], q[6];
cx q[9], q[8];
cx q[13], q[10];
cx q[15], q[14];
cx q[6], q[7];
cx q[4], q[11];
cx q[1], q[6];
cx q[6], q[7];
cx q[7], q[6];
