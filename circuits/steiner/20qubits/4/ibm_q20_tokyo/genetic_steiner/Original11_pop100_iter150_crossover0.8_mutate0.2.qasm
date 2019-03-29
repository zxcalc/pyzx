// Initial wiring: [10, 7, 11, 17, 8, 3, 15, 2, 6, 4, 9, 1, 13, 12, 0, 18, 14, 5, 16, 19]
// Resulting wiring: [10, 7, 11, 17, 8, 3, 15, 2, 6, 4, 9, 1, 13, 12, 0, 18, 14, 5, 16, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[7];
cx q[14], q[5];
cx q[18], q[17];
cx q[2], q[3];
