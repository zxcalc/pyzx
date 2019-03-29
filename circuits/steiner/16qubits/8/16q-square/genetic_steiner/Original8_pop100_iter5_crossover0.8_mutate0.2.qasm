// Initial wiring: [8, 14, 12, 5, 4, 10, 13, 3, 6, 2, 9, 0, 15, 7, 1, 11]
// Resulting wiring: [8, 14, 12, 5, 4, 10, 13, 3, 6, 2, 9, 0, 15, 7, 1, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[7], q[0];
cx q[8], q[7];
cx q[9], q[8];
cx q[10], q[5];
cx q[5], q[2];
cx q[10], q[5];
cx q[13], q[12];
cx q[14], q[13];
cx q[13], q[10];
cx q[10], q[5];
cx q[5], q[2];
cx q[10], q[5];
cx q[13], q[10];
cx q[7], q[8];
cx q[6], q[7];
cx q[5], q[6];
cx q[6], q[7];
cx q[7], q[8];
cx q[7], q[6];
