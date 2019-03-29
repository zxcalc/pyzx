// Initial wiring: [8, 3, 12, 14, 11, 7, 17, 13, 0, 16, 6, 5, 2, 19, 18, 10, 4, 1, 15, 9]
// Resulting wiring: [8, 3, 12, 14, 11, 7, 17, 13, 0, 16, 6, 5, 2, 19, 18, 10, 4, 1, 15, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[1];
cx q[9], q[11];
cx q[7], q[12];
cx q[4], q[6];
