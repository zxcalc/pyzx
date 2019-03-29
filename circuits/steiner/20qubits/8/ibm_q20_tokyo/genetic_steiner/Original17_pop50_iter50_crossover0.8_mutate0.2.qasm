// Initial wiring: [14, 6, 8, 13, 7, 18, 1, 3, 11, 10, 16, 9, 5, 17, 0, 15, 12, 2, 4, 19]
// Resulting wiring: [14, 6, 8, 13, 7, 18, 1, 3, 11, 10, 16, 9, 5, 17, 0, 15, 12, 2, 4, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[1];
cx q[1], q[0];
cx q[4], q[3];
cx q[6], q[5];
cx q[11], q[10];
cx q[12], q[13];
