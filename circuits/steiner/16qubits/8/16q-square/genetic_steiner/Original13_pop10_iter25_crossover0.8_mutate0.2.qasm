// Initial wiring: [12, 5, 10, 2, 4, 6, 15, 3, 1, 9, 8, 13, 14, 11, 0, 7]
// Resulting wiring: [12, 5, 10, 2, 4, 6, 15, 3, 1, 9, 8, 13, 14, 11, 0, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[1], q[0];
cx q[6], q[1];
cx q[10], q[5];
cx q[11], q[4];
cx q[14], q[9];
cx q[9], q[6];
cx q[6], q[1];
cx q[1], q[0];
cx q[6], q[1];
cx q[10], q[13];
cx q[10], q[11];
cx q[6], q[9];
cx q[5], q[10];
cx q[5], q[6];
cx q[10], q[13];
cx q[10], q[11];
cx q[6], q[9];
cx q[9], q[6];
cx q[13], q[10];
