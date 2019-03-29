// Initial wiring: [6, 10, 7, 0, 12, 8, 3, 4, 5, 1, 13, 15, 9, 14, 11, 2]
// Resulting wiring: [6, 10, 7, 0, 12, 8, 3, 4, 5, 1, 13, 15, 9, 14, 11, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[4], q[3];
cx q[5], q[4];
cx q[4], q[3];
cx q[5], q[4];
cx q[7], q[0];
cx q[9], q[6];
cx q[10], q[5];
cx q[5], q[2];
cx q[10], q[5];
cx q[15], q[14];
cx q[14], q[9];
cx q[9], q[6];
cx q[6], q[5];
cx q[5], q[2];
cx q[6], q[5];
cx q[14], q[9];
cx q[1], q[2];
