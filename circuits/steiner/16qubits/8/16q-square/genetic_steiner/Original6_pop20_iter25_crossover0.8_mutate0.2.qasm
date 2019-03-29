// Initial wiring: [8, 1, 7, 3, 14, 2, 13, 9, 0, 12, 10, 5, 11, 6, 15, 4]
// Resulting wiring: [8, 1, 7, 3, 14, 2, 13, 9, 0, 12, 10, 5, 11, 6, 15, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[11], q[10];
cx q[10], q[9];
cx q[11], q[10];
cx q[13], q[12];
cx q[14], q[13];
cx q[13], q[14];
cx q[9], q[10];
cx q[8], q[9];
cx q[9], q[10];
cx q[10], q[13];
cx q[13], q[14];
cx q[10], q[9];
cx q[6], q[7];
cx q[4], q[5];
