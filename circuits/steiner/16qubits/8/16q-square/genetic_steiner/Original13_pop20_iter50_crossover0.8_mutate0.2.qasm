// Initial wiring: [7, 3, 10, 5, 1, 11, 4, 15, 2, 13, 8, 6, 12, 9, 0, 14]
// Resulting wiring: [7, 3, 10, 5, 1, 11, 4, 15, 2, 13, 8, 6, 12, 9, 0, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[11], q[10];
cx q[10], q[9];
cx q[10], q[5];
cx q[11], q[10];
cx q[14], q[13];
cx q[12], q[13];
cx q[11], q[12];
cx q[12], q[13];
cx q[13], q[12];
cx q[10], q[13];
cx q[10], q[11];
cx q[11], q[10];
cx q[5], q[10];
