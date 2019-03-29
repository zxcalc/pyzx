// Initial wiring: [10, 7, 6, 3, 13, 8, 11, 15, 9, 12, 4, 1, 14, 2, 5, 0]
// Resulting wiring: [10, 7, 6, 3, 13, 8, 11, 15, 9, 12, 4, 1, 14, 2, 5, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[6], q[5];
cx q[6], q[1];
cx q[10], q[9];
cx q[11], q[10];
cx q[10], q[5];
cx q[12], q[11];
cx q[11], q[10];
cx q[10], q[9];
cx q[12], q[11];
cx q[6], q[7];
