// Initial wiring: [6, 15, 11, 13, 1, 16, 0, 7, 4, 2, 5, 9, 12, 19, 3, 18, 14, 17, 8, 10]
// Resulting wiring: [6, 15, 11, 13, 1, 16, 0, 7, 4, 2, 5, 9, 12, 19, 3, 18, 14, 17, 8, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[2];
cx q[19], q[18];
cx q[18], q[12];
cx q[17], q[18];
