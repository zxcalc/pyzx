// Initial wiring: [7, 17, 15, 0, 3, 1, 9, 4, 2, 10, 5, 14, 8, 19, 11, 18, 16, 13, 12, 6]
// Resulting wiring: [7, 17, 15, 0, 3, 1, 9, 4, 2, 10, 5, 14, 8, 19, 11, 18, 16, 13, 12, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[1];
cx q[12], q[11];
cx q[18], q[19];
cx q[9], q[11];
