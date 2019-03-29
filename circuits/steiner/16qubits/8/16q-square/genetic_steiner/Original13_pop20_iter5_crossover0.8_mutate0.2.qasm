// Initial wiring: [5, 6, 15, 14, 3, 4, 8, 7, 13, 11, 9, 0, 1, 12, 2, 10]
// Resulting wiring: [5, 6, 15, 14, 3, 4, 8, 7, 13, 11, 9, 0, 1, 12, 2, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[7], q[6];
cx q[6], q[5];
cx q[7], q[6];
cx q[8], q[7];
cx q[7], q[6];
cx q[6], q[5];
cx q[7], q[6];
cx q[8], q[7];
cx q[9], q[8];
cx q[11], q[10];
cx q[10], q[13];
cx q[9], q[10];
cx q[6], q[9];
cx q[1], q[6];
cx q[6], q[9];
cx q[9], q[10];
cx q[9], q[8];
cx q[9], q[6];
