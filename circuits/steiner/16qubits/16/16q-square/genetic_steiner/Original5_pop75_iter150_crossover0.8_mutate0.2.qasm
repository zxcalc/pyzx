// Initial wiring: [13, 1, 4, 7, 5, 14, 0, 15, 2, 9, 10, 11, 12, 8, 3, 6]
// Resulting wiring: [13, 1, 4, 7, 5, 14, 0, 15, 2, 9, 10, 11, 12, 8, 3, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[5], q[4];
cx q[6], q[1];
cx q[7], q[6];
cx q[6], q[5];
cx q[5], q[4];
cx q[5], q[2];
cx q[7], q[0];
cx q[7], q[6];
cx q[9], q[8];
cx q[10], q[5];
cx q[5], q[4];
cx q[5], q[2];
cx q[10], q[9];
cx q[10], q[5];
cx q[12], q[11];
cx q[11], q[4];
cx q[13], q[12];
cx q[14], q[13];
cx q[6], q[9];
