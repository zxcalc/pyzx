// Initial wiring: [12, 14, 0, 7, 5, 15, 19, 10, 8, 2, 17, 16, 1, 11, 4, 6, 18, 3, 9, 13]
// Resulting wiring: [12, 14, 0, 7, 5, 15, 19, 10, 8, 2, 17, 16, 1, 11, 4, 6, 18, 3, 9, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[9];
cx q[18], q[11];
cx q[13], q[14];
cx q[1], q[2];
