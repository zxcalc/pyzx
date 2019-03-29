// Initial wiring: [6, 4, 9, 19, 2, 3, 14, 12, 11, 1, 15, 17, 8, 13, 5, 18, 0, 10, 7, 16]
// Resulting wiring: [6, 4, 9, 19, 2, 3, 14, 12, 11, 1, 15, 17, 8, 13, 5, 18, 0, 10, 7, 16]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[17], q[12];
cx q[12], q[7];
cx q[11], q[12];
cx q[1], q[8];
