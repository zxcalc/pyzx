// Initial wiring: [10, 1, 5, 16, 18, 7, 12, 9, 14, 8, 6, 0, 4, 11, 2, 15, 3, 19, 17, 13]
// Resulting wiring: [10, 1, 5, 16, 18, 7, 12, 9, 14, 8, 6, 0, 4, 11, 2, 15, 3, 19, 17, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[5];
cx q[12], q[17];
cx q[2], q[3];
cx q[0], q[1];
