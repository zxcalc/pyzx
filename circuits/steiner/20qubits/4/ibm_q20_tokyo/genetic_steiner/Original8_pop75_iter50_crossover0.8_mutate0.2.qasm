// Initial wiring: [3, 8, 10, 7, 19, 15, 17, 12, 9, 14, 6, 11, 4, 0, 16, 5, 18, 13, 2, 1]
// Resulting wiring: [3, 8, 10, 7, 19, 15, 17, 12, 9, 14, 6, 11, 4, 0, 16, 5, 18, 13, 2, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[3];
cx q[6], q[13];
cx q[5], q[6];
cx q[0], q[1];
