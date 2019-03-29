// Initial wiring: [8, 15, 9, 5, 7, 4, 13, 12, 3, 19, 11, 6, 0, 2, 16, 1, 18, 10, 14, 17]
// Resulting wiring: [8, 15, 9, 5, 7, 4, 13, 12, 3, 19, 11, 6, 0, 2, 16, 1, 18, 10, 14, 17]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[3];
cx q[6], q[4];
cx q[9], q[8];
cx q[12], q[11];
