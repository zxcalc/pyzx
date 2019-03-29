// Initial wiring: [5, 14, 9, 8, 2, 15, 10, 11, 16, 1, 19, 3, 7, 17, 4, 6, 13, 0, 12, 18]
// Resulting wiring: [5, 14, 9, 8, 2, 15, 10, 11, 16, 1, 19, 3, 7, 17, 4, 6, 13, 0, 12, 18]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[17], q[16];
cx q[19], q[18];
cx q[10], q[11];
cx q[9], q[11];
cx q[7], q[13];
cx q[7], q[12];
cx q[4], q[5];
