// Initial wiring: [10, 1, 15, 0, 14, 11, 6, 13, 7, 2, 8, 12, 5, 9, 4, 3]
// Resulting wiring: [10, 1, 15, 0, 14, 11, 6, 13, 7, 2, 8, 12, 5, 9, 4, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[2], q[1];
cx q[1], q[0];
cx q[4], q[3];
cx q[5], q[4];
cx q[4], q[3];
cx q[5], q[4];
cx q[13], q[10];
cx q[14], q[13];
cx q[13], q[12];
cx q[14], q[13];
cx q[10], q[13];
cx q[13], q[12];
cx q[9], q[10];
cx q[10], q[13];
cx q[13], q[12];
cx q[10], q[9];
cx q[13], q[10];
