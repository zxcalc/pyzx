// Initial wiring: [1, 12, 14, 11, 15, 3, 2, 7, 13, 6, 8, 10, 9, 5, 0, 4]
// Resulting wiring: [1, 12, 14, 11, 15, 3, 2, 7, 13, 6, 8, 10, 9, 5, 0, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[6], q[5];
cx q[6], q[1];
cx q[7], q[6];
cx q[6], q[5];
cx q[5], q[4];
cx q[6], q[1];
cx q[6], q[5];
cx q[7], q[6];
cx q[9], q[6];
cx q[6], q[5];
cx q[9], q[8];
cx q[9], q[6];
cx q[10], q[9];
cx q[10], q[5];
cx q[11], q[10];
cx q[10], q[9];
cx q[10], q[5];
cx q[11], q[10];
cx q[9], q[10];
cx q[6], q[9];
cx q[5], q[10];
cx q[0], q[7];
cx q[0], q[1];
