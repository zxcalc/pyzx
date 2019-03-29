// Initial wiring: [10, 18, 11, 13, 0, 8, 3, 7, 15, 16, 4, 17, 19, 5, 9, 1, 6, 12, 14, 2]
// Resulting wiring: [10, 18, 11, 13, 0, 8, 3, 7, 15, 16, 4, 17, 19, 5, 9, 1, 6, 12, 14, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[7];
cx q[17], q[12];
cx q[12], q[7];
cx q[18], q[11];
cx q[1], q[8];
cx q[1], q[2];
