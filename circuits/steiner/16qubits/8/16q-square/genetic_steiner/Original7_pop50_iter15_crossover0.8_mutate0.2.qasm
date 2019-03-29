// Initial wiring: [4, 0, 8, 5, 15, 11, 10, 6, 9, 7, 3, 14, 2, 1, 13, 12]
// Resulting wiring: [4, 0, 8, 5, 15, 11, 10, 6, 9, 7, 3, 14, 2, 1, 13, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[11], q[10];
cx q[10], q[5];
cx q[11], q[10];
cx q[12], q[11];
cx q[11], q[10];
cx q[10], q[5];
cx q[11], q[10];
cx q[12], q[11];
cx q[14], q[9];
cx q[6], q[9];
cx q[6], q[7];
cx q[5], q[10];
cx q[10], q[9];
cx q[0], q[7];
