// Initial wiring: [6, 9, 4, 10, 5, 1, 11, 12, 7, 13, 3, 2, 14, 8, 15, 0]
// Resulting wiring: [6, 9, 4, 10, 5, 1, 11, 12, 7, 13, 3, 2, 14, 8, 15, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[6], q[1];
cx q[1], q[0];
cx q[7], q[6];
cx q[9], q[6];
cx q[6], q[1];
cx q[9], q[6];
cx q[11], q[10];
cx q[10], q[5];
cx q[12], q[11];
cx q[11], q[10];
cx q[10], q[5];
cx q[12], q[11];
cx q[15], q[8];
cx q[6], q[7];
cx q[5], q[6];
cx q[6], q[7];
cx q[7], q[6];
