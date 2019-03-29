// Initial wiring: [4, 1, 12, 17, 15, 16, 0, 11, 14, 3, 5, 6, 18, 9, 19, 13, 2, 7, 8, 10]
// Resulting wiring: [4, 1, 12, 17, 15, 16, 0, 11, 14, 3, 5, 6, 18, 9, 19, 13, 2, 7, 8, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[1];
cx q[10], q[9];
cx q[18], q[11];
cx q[2], q[7];
