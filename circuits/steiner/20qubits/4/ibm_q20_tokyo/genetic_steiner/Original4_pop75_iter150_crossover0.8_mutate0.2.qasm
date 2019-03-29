// Initial wiring: [8, 7, 12, 10, 11, 16, 0, 15, 2, 9, 4, 5, 1, 17, 3, 13, 18, 6, 14, 19]
// Resulting wiring: [8, 7, 12, 10, 11, 16, 0, 15, 2, 9, 4, 5, 1, 17, 3, 13, 18, 6, 14, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[3];
cx q[11], q[8];
cx q[7], q[12];
cx q[5], q[6];
