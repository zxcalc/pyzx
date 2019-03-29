// Initial wiring: [0, 9, 4, 5, 6, 10, 18, 17, 2, 13, 14, 15, 3, 7, 12, 16, 11, 8, 1, 19]
// Resulting wiring: [0, 9, 4, 5, 6, 10, 18, 17, 2, 13, 14, 15, 3, 7, 12, 16, 11, 8, 1, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[1];
cx q[1], q[0];
cx q[16], q[15];
cx q[14], q[15];
cx q[9], q[11];
cx q[9], q[10];
cx q[2], q[8];
cx q[2], q[3];
