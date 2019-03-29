// Initial wiring: [8, 9, 5, 14, 12, 1, 11, 3, 13, 10, 7, 4, 0, 15, 6, 2]
// Resulting wiring: [8, 9, 5, 14, 12, 1, 11, 3, 13, 10, 7, 4, 0, 15, 6, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[0];
cx q[9], q[8];
cx q[8], q[7];
cx q[10], q[5];
cx q[5], q[4];
cx q[10], q[5];
cx q[14], q[9];
cx q[9], q[8];
cx q[8], q[7];
cx q[14], q[9];
cx q[15], q[14];
cx q[10], q[13];
cx q[9], q[14];
cx q[5], q[10];
