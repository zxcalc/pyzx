// Initial wiring: [5, 6, 17, 12, 16, 11, 13, 18, 1, 19, 14, 4, 0, 8, 10, 2, 15, 3, 7, 9]
// Resulting wiring: [5, 6, 17, 12, 16, 11, 13, 18, 1, 19, 14, 4, 0, 8, 10, 2, 15, 3, 7, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[3];
cx q[14], q[10];
cx q[17], q[10];
cx q[12], q[9];
cx q[16], q[19];
cx q[7], q[13];
cx q[0], q[11];
cx q[0], q[7];
