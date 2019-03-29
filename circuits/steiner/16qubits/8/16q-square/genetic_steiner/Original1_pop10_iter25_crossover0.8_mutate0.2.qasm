// Initial wiring: [14, 1, 2, 12, 15, 11, 6, 3, 5, 0, 4, 9, 13, 10, 7, 8]
// Resulting wiring: [14, 1, 2, 12, 15, 11, 6, 3, 5, 0, 4, 9, 13, 10, 7, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[3], q[2];
cx q[12], q[11];
cx q[11], q[4];
cx q[9], q[14];
cx q[5], q[6];
cx q[4], q[11];
cx q[3], q[4];
cx q[4], q[11];
cx q[11], q[4];
cx q[2], q[3];
cx q[0], q[1];
cx q[1], q[2];
cx q[2], q[3];
cx q[0], q[7];
cx q[3], q[2];
