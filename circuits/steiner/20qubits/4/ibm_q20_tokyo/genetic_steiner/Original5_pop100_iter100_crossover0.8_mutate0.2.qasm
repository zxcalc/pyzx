// Initial wiring: [15, 3, 17, 8, 12, 10, 14, 1, 9, 4, 7, 11, 6, 19, 0, 18, 16, 5, 2, 13]
// Resulting wiring: [15, 3, 17, 8, 12, 10, 14, 1, 9, 4, 7, 11, 6, 19, 0, 18, 16, 5, 2, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[3];
cx q[9], q[11];
cx q[3], q[4];
cx q[2], q[3];
