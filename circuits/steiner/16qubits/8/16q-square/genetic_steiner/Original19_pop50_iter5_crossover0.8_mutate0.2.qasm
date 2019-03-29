// Initial wiring: [6, 9, 13, 2, 8, 11, 12, 3, 0, 15, 14, 1, 4, 10, 7, 5]
// Resulting wiring: [6, 9, 13, 2, 8, 11, 12, 3, 0, 15, 14, 1, 4, 10, 7, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[5], q[4];
cx q[10], q[9];
cx q[9], q[6];
cx q[10], q[9];
cx q[12], q[11];
cx q[11], q[4];
cx q[11], q[12];
cx q[10], q[11];
cx q[11], q[12];
cx q[12], q[11];
cx q[9], q[14];
cx q[6], q[9];
cx q[5], q[6];
cx q[6], q[9];
cx q[9], q[14];
cx q[9], q[6];
