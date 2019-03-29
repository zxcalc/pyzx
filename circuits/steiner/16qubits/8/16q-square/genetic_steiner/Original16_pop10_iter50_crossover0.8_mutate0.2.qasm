// Initial wiring: [1, 10, 8, 15, 2, 4, 9, 13, 12, 6, 11, 7, 3, 14, 0, 5]
// Resulting wiring: [1, 10, 8, 15, 2, 4, 9, 13, 12, 6, 11, 7, 3, 14, 0, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[9], q[8];
cx q[11], q[10];
cx q[10], q[9];
cx q[9], q[8];
cx q[14], q[13];
cx q[13], q[10];
cx q[15], q[14];
cx q[10], q[13];
cx q[13], q[14];
cx q[14], q[15];
cx q[5], q[10];
cx q[4], q[5];
cx q[5], q[10];
cx q[10], q[13];
cx q[13], q[14];
cx q[14], q[15];
cx q[13], q[10];
cx q[15], q[14];
