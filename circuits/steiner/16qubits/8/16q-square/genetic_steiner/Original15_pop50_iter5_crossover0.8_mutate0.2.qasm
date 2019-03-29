// Initial wiring: [15, 11, 1, 6, 5, 0, 4, 3, 13, 12, 2, 9, 7, 14, 10, 8]
// Resulting wiring: [15, 11, 1, 6, 5, 0, 4, 3, 13, 12, 2, 9, 7, 14, 10, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[5], q[2];
cx q[7], q[6];
cx q[8], q[7];
cx q[7], q[6];
cx q[13], q[12];
cx q[15], q[14];
cx q[10], q[13];
cx q[13], q[12];
cx q[2], q[5];
cx q[5], q[6];
cx q[1], q[2];
cx q[0], q[1];
cx q[1], q[2];
cx q[2], q[5];
cx q[2], q[1];
cx q[5], q[2];
