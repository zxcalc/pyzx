// Initial wiring: [1, 11, 14, 3, 16, 13, 8, 18, 2, 5, 6, 12, 0, 15, 9, 17, 10, 7, 19, 4]
// Resulting wiring: [1, 11, 14, 3, 16, 13, 8, 18, 2, 5, 6, 12, 0, 15, 9, 17, 10, 7, 19, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[6];
cx q[17], q[12];
cx q[15], q[2];
cx q[15], q[5];
cx q[7], q[11];
cx q[1], q[10];
