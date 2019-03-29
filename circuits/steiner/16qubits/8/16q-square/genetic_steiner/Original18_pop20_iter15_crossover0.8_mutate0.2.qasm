// Initial wiring: [8, 14, 5, 9, 2, 3, 1, 0, 13, 7, 15, 6, 11, 4, 12, 10]
// Resulting wiring: [8, 14, 5, 9, 2, 3, 1, 0, 13, 7, 15, 6, 11, 4, 12, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[6], q[5];
cx q[5], q[4];
cx q[6], q[1];
cx q[7], q[6];
cx q[6], q[1];
cx q[8], q[7];
cx q[7], q[6];
cx q[6], q[5];
cx q[7], q[6];
cx q[8], q[7];
cx q[13], q[12];
cx q[15], q[8];
cx q[10], q[13];
cx q[13], q[12];
cx q[5], q[10];
cx q[10], q[13];
