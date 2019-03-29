// Initial wiring: [4, 15, 9, 10, 3, 18, 0, 19, 11, 1, 6, 13, 7, 16, 8, 12, 17, 2, 5, 14]
// Resulting wiring: [4, 15, 9, 10, 3, 18, 0, 19, 11, 1, 6, 13, 7, 16, 8, 12, 17, 2, 5, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[9], q[0];
cx q[15], q[13];
cx q[11], q[12];
cx q[9], q[10];
cx q[2], q[7];
cx q[1], q[8];
cx q[8], q[9];
