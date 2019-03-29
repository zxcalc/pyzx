// Initial wiring: [2, 6, 14, 7, 13, 10, 15, 8, 17, 5, 19, 18, 0, 3, 9, 16, 12, 1, 4, 11]
// Resulting wiring: [2, 6, 14, 7, 13, 10, 15, 8, 17, 5, 19, 18, 0, 3, 9, 16, 12, 1, 4, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[1];
cx q[9], q[8];
cx q[17], q[11];
cx q[14], q[15];
cx q[3], q[4];
cx q[1], q[2];
