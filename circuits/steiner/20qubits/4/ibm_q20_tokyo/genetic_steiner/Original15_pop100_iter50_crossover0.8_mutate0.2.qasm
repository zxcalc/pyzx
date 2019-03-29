// Initial wiring: [6, 3, 19, 7, 1, 11, 2, 8, 17, 0, 4, 14, 16, 10, 13, 15, 18, 9, 12, 5]
// Resulting wiring: [6, 3, 19, 7, 1, 11, 2, 8, 17, 0, 4, 14, 16, 10, 13, 15, 18, 9, 12, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[11];
cx q[14], q[13];
cx q[16], q[13];
cx q[18], q[11];
