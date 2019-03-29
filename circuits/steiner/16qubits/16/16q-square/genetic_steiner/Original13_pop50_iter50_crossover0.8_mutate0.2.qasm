// Initial wiring: [8, 9, 14, 12, 7, 15, 3, 4, 5, 11, 2, 10, 0, 13, 1, 6]
// Resulting wiring: [8, 9, 14, 12, 7, 15, 3, 4, 5, 11, 2, 10, 0, 13, 1, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[1], q[0];
cx q[3], q[2];
cx q[6], q[1];
cx q[6], q[5];
cx q[1], q[0];
cx q[7], q[6];
cx q[6], q[5];
cx q[5], q[4];
cx q[7], q[0];
cx q[10], q[9];
cx q[12], q[11];
cx q[14], q[9];
cx q[15], q[8];
cx q[6], q[7];
cx q[7], q[6];
cx q[1], q[6];
cx q[6], q[7];
cx q[6], q[5];
