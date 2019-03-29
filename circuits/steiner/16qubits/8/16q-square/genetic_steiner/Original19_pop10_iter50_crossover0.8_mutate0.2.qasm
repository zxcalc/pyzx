// Initial wiring: [3, 13, 1, 2, 5, 8, 14, 4, 9, 12, 11, 0, 15, 7, 10, 6]
// Resulting wiring: [3, 13, 1, 2, 5, 8, 14, 4, 9, 12, 11, 0, 15, 7, 10, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[6], q[5];
cx q[7], q[6];
cx q[9], q[6];
cx q[6], q[5];
cx q[9], q[6];
cx q[10], q[5];
cx q[13], q[12];
cx q[9], q[10];
cx q[10], q[13];
cx q[13], q[12];
cx q[6], q[9];
cx q[6], q[7];
cx q[2], q[5];
