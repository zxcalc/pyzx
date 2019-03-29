// Initial wiring: [8, 4, 14, 7, 13, 6, 10, 2, 0, 9, 12, 11, 15, 1, 3, 5]
// Resulting wiring: [8, 4, 14, 7, 13, 6, 10, 2, 0, 9, 12, 11, 15, 1, 3, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[7], q[6];
cx q[10], q[5];
cx q[5], q[2];
cx q[14], q[15];
cx q[12], q[13];
cx q[13], q[14];
cx q[0], q[7];
cx q[7], q[6];
