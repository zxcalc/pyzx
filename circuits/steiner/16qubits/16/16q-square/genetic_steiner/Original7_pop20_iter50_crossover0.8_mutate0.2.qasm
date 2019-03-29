// Initial wiring: [13, 15, 12, 0, 9, 4, 5, 1, 10, 3, 7, 11, 14, 8, 6, 2]
// Resulting wiring: [13, 15, 12, 0, 9, 4, 5, 1, 10, 3, 7, 11, 14, 8, 6, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[5], q[2];
cx q[6], q[1];
cx q[1], q[0];
cx q[7], q[6];
cx q[8], q[7];
cx q[7], q[6];
cx q[7], q[0];
cx q[9], q[6];
cx q[10], q[9];
cx q[9], q[6];
cx q[6], q[1];
cx q[9], q[6];
cx q[14], q[9];
cx q[10], q[13];
cx q[9], q[14];
cx q[8], q[9];
cx q[6], q[9];
cx q[9], q[14];
cx q[14], q[9];
cx q[4], q[11];
cx q[11], q[10];
cx q[10], q[13];
cx q[13], q[10];
