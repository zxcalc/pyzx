// Initial wiring: [5, 8, 15, 10, 1, 17, 0, 9, 7, 3, 4, 2, 19, 12, 11, 14, 6, 16, 18, 13]
// Resulting wiring: [5, 8, 15, 10, 1, 17, 0, 9, 7, 3, 4, 2, 19, 12, 11, 14, 6, 16, 18, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[11], q[10];
cx q[13], q[7];
cx q[19], q[10];
cx q[13], q[16];
cx q[13], q[15];
cx q[9], q[10];
cx q[1], q[7];
