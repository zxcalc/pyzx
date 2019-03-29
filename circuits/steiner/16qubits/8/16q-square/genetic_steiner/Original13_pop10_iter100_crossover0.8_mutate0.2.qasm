// Initial wiring: [2, 14, 5, 8, 11, 6, 13, 15, 10, 9, 4, 3, 7, 12, 0, 1]
// Resulting wiring: [2, 14, 5, 8, 11, 6, 13, 15, 10, 9, 4, 3, 7, 12, 0, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[5], q[4];
cx q[14], q[9];
cx q[10], q[13];
cx q[9], q[10];
cx q[10], q[13];
cx q[6], q[9];
cx q[9], q[10];
cx q[4], q[5];
cx q[5], q[4];
cx q[3], q[4];
cx q[4], q[5];
cx q[5], q[6];
cx q[6], q[9];
