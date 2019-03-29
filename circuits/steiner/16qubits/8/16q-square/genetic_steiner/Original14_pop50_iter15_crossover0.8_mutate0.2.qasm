// Initial wiring: [1, 12, 15, 0, 5, 2, 8, 6, 11, 3, 10, 4, 9, 7, 14, 13]
// Resulting wiring: [1, 12, 15, 0, 5, 2, 8, 6, 11, 3, 10, 4, 9, 7, 14, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[9], q[6];
cx q[6], q[1];
cx q[13], q[10];
cx q[10], q[9];
cx q[10], q[13];
cx q[9], q[10];
cx q[8], q[9];
cx q[9], q[10];
cx q[10], q[13];
cx q[10], q[9];
cx q[7], q[8];
cx q[5], q[10];
