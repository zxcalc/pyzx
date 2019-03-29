// Initial wiring: [3, 15, 1, 6, 11, 4, 17, 7, 8, 19, 9, 16, 2, 10, 18, 12, 5, 14, 0, 13]
// Resulting wiring: [3, 15, 1, 6, 11, 4, 17, 7, 8, 19, 9, 16, 2, 10, 18, 12, 5, 14, 0, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[17], q[18];
cx q[10], q[11];
cx q[6], q[12];
cx q[4], q[5];
