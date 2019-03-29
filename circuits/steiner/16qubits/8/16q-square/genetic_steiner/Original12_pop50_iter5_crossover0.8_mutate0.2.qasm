// Initial wiring: [9, 12, 11, 8, 2, 10, 15, 13, 7, 5, 3, 1, 4, 0, 14, 6]
// Resulting wiring: [9, 12, 11, 8, 2, 10, 15, 13, 7, 5, 3, 1, 4, 0, 14, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[7], q[6];
cx q[7], q[0];
cx q[8], q[7];
cx q[7], q[6];
cx q[6], q[1];
cx q[8], q[7];
cx q[9], q[6];
cx q[6], q[1];
cx q[9], q[6];
cx q[13], q[14];
cx q[12], q[13];
cx q[13], q[14];
cx q[9], q[10];
cx q[5], q[10];
