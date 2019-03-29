// Initial wiring: [5, 12, 6, 8, 10, 2, 1, 13, 4, 14, 7, 15, 11, 0, 9, 3]
// Resulting wiring: [5, 12, 6, 8, 10, 2, 1, 13, 4, 14, 7, 15, 11, 0, 9, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[10], q[9];
cx q[12], q[13];
cx q[11], q[12];
cx q[12], q[13];
cx q[13], q[12];
cx q[7], q[8];
cx q[8], q[15];
cx q[8], q[7];
cx q[6], q[7];
cx q[7], q[8];
cx q[8], q[7];
cx q[5], q[10];
cx q[10], q[9];
cx q[3], q[4];
