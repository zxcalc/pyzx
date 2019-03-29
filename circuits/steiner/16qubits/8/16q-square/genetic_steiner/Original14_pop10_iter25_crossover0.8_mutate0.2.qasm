// Initial wiring: [14, 6, 3, 1, 9, 8, 12, 15, 0, 11, 7, 5, 4, 10, 2, 13]
// Resulting wiring: [14, 6, 3, 1, 9, 8, 12, 15, 0, 11, 7, 5, 4, 10, 2, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[13];
cx q[9], q[10];
cx q[10], q[13];
cx q[2], q[5];
cx q[5], q[6];
cx q[6], q[9];
cx q[6], q[5];
cx q[1], q[6];
cx q[6], q[9];
cx q[6], q[5];
