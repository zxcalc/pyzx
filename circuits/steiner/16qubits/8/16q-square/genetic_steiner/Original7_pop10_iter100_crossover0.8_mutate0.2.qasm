// Initial wiring: [15, 5, 0, 8, 6, 3, 4, 12, 9, 11, 7, 13, 10, 14, 2, 1]
// Resulting wiring: [15, 5, 0, 8, 6, 3, 4, 12, 9, 11, 7, 13, 10, 14, 2, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[5], q[4];
cx q[6], q[5];
cx q[5], q[4];
cx q[11], q[4];
cx q[12], q[11];
cx q[11], q[10];
cx q[11], q[4];
cx q[12], q[11];
cx q[14], q[9];
cx q[9], q[6];
cx q[6], q[5];
cx q[9], q[6];
cx q[5], q[10];
