// Initial wiring: [12, 6, 4, 17, 9, 2, 5, 0, 19, 16, 10, 14, 8, 13, 7, 18, 3, 15, 11, 1]
// Resulting wiring: [12, 6, 4, 17, 9, 2, 5, 0, 19, 16, 10, 14, 8, 13, 7, 18, 3, 15, 11, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[3];
cx q[12], q[11];
cx q[10], q[11];
cx q[0], q[1];
