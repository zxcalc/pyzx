// Initial wiring: [12, 10, 15, 19, 7, 3, 9, 6, 11, 5, 16, 4, 14, 8, 0, 13, 2, 17, 18, 1]
// Resulting wiring: [12, 10, 15, 19, 7, 3, 9, 6, 11, 5, 16, 4, 14, 8, 0, 13, 2, 17, 18, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[18], q[12];
cx q[18], q[11];
cx q[8], q[9];
cx q[1], q[2];
