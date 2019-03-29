// Initial wiring: [14, 10, 11, 9, 17, 7, 2, 4, 5, 3, 8, 13, 12, 16, 1, 6, 15, 0, 18, 19]
// Resulting wiring: [14, 10, 11, 9, 17, 7, 2, 4, 5, 3, 8, 13, 12, 16, 1, 6, 15, 0, 18, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[18], q[11];
cx q[14], q[15];
cx q[10], q[11];
cx q[0], q[9];
