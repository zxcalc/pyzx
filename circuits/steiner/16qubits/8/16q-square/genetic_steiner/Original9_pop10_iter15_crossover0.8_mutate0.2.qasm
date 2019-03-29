// Initial wiring: [14, 6, 0, 7, 2, 10, 12, 8, 13, 11, 4, 3, 5, 1, 15, 9]
// Resulting wiring: [14, 6, 0, 7, 2, 10, 12, 8, 13, 11, 4, 3, 5, 1, 15, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[5], q[2];
cx q[2], q[1];
cx q[5], q[4];
cx q[5], q[2];
cx q[6], q[1];
cx q[6], q[5];
cx q[1], q[0];
cx q[7], q[6];
cx q[6], q[5];
cx q[5], q[4];
cx q[7], q[6];
cx q[12], q[11];
cx q[14], q[13];
cx q[13], q[12];
cx q[12], q[11];
cx q[11], q[12];
