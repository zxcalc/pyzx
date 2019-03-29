// Initial wiring: [1, 12, 10, 0, 7, 8, 14, 11, 2, 9, 3, 4, 15, 6, 5, 13]
// Resulting wiring: [1, 12, 10, 0, 7, 8, 14, 11, 2, 9, 3, 4, 15, 6, 5, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[8], q[7];
cx q[10], q[9];
cx q[11], q[10];
cx q[10], q[5];
cx q[12], q[11];
cx q[11], q[4];
cx q[12], q[11];
cx q[13], q[14];
cx q[11], q[12];
cx q[10], q[11];
cx q[11], q[12];
cx q[11], q[10];
cx q[6], q[9];
cx q[9], q[10];
cx q[10], q[11];
cx q[11], q[12];
cx q[1], q[6];
cx q[0], q[7];
