// Initial wiring: [19, 17, 11, 14, 2, 13, 3, 18, 12, 9, 6, 5, 0, 4, 8, 15, 7, 10, 16, 1]
// Resulting wiring: [19, 17, 11, 14, 2, 13, 3, 18, 12, 9, 6, 5, 0, 4, 8, 15, 7, 10, 16, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[1];
cx q[5], q[4];
cx q[12], q[6];
cx q[18], q[11];
