// Initial wiring: [5, 8, 10, 13, 9, 2, 7, 4, 6, 0, 3, 12, 14, 1, 15, 11]
// Resulting wiring: [5, 8, 10, 13, 9, 2, 7, 4, 6, 0, 3, 12, 14, 1, 15, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[11], q[4];
cx q[13], q[12];
cx q[12], q[11];
cx q[13], q[10];
cx q[13], q[12];
cx q[15], q[8];
cx q[12], q[13];
cx q[10], q[13];
cx q[10], q[11];
cx q[5], q[10];
cx q[10], q[13];
cx q[10], q[11];
cx q[13], q[10];
cx q[3], q[4];
