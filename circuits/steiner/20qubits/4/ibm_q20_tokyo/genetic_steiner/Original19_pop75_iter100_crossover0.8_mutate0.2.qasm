// Initial wiring: [14, 9, 10, 1, 13, 5, 16, 12, 15, 17, 18, 19, 7, 6, 2, 0, 11, 4, 3, 8]
// Resulting wiring: [14, 9, 10, 1, 13, 5, 16, 12, 15, 17, 18, 19, 7, 6, 2, 0, 11, 4, 3, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[17], q[11];
cx q[7], q[12];
cx q[5], q[6];
cx q[2], q[3];
