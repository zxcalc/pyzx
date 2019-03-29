// Initial wiring: [5, 15, 1, 3, 7, 14, 12, 17, 11, 4, 0, 18, 6, 8, 2, 10, 16, 13, 9, 19]
// Resulting wiring: [5, 15, 1, 3, 7, 14, 12, 17, 11, 4, 0, 18, 6, 8, 2, 10, 16, 13, 9, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[8];
cx q[15], q[13];
cx q[13], q[6];
cx q[7], q[13];
