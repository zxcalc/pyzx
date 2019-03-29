// Initial wiring: [14, 3, 1, 6, 7, 12, 19, 8, 5, 17, 13, 18, 9, 10, 16, 15, 4, 11, 2, 0]
// Resulting wiring: [14, 3, 1, 6, 7, 12, 19, 8, 5, 17, 13, 18, 9, 10, 16, 15, 4, 11, 2, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[17], q[12];
cx q[11], q[12];
cx q[2], q[8];
