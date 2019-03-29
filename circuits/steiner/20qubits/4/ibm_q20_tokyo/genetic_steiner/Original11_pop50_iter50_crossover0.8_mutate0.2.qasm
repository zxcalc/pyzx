// Initial wiring: [14, 17, 11, 13, 6, 12, 2, 10, 16, 0, 5, 3, 18, 9, 19, 15, 7, 1, 4, 8]
// Resulting wiring: [14, 17, 11, 13, 6, 12, 2, 10, 16, 0, 5, 3, 18, 9, 19, 15, 7, 1, 4, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[1];
cx q[9], q[11];
cx q[8], q[10];
cx q[3], q[6];
