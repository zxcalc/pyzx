// Initial wiring: [3, 7, 0, 5, 9, 14, 10, 4, 15, 8, 12, 18, 1, 13, 17, 11, 6, 2, 19, 16]
// Resulting wiring: [3, 7, 0, 5, 9, 14, 10, 4, 15, 8, 12, 18, 1, 13, 17, 11, 6, 2, 19, 16]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[11], q[10];
cx q[11], q[9];
cx q[14], q[13];
cx q[14], q[5];
cx q[15], q[16];
cx q[1], q[2];
