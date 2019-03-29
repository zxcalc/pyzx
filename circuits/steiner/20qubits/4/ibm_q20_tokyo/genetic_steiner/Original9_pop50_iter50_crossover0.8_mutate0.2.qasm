// Initial wiring: [2, 11, 13, 0, 18, 7, 12, 14, 4, 6, 5, 19, 15, 3, 8, 10, 9, 16, 17, 1]
// Resulting wiring: [2, 11, 13, 0, 18, 7, 12, 14, 4, 6, 5, 19, 15, 3, 8, 10, 9, 16, 17, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[15], q[14];
cx q[17], q[11];
cx q[6], q[12];
cx q[5], q[14];
