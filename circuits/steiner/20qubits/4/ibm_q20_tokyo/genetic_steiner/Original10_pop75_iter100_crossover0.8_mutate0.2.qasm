// Initial wiring: [0, 1, 2, 18, 17, 16, 6, 12, 8, 7, 13, 15, 9, 4, 5, 10, 19, 11, 3, 14]
// Resulting wiring: [0, 1, 2, 18, 17, 16, 6, 12, 8, 7, 13, 15, 9, 4, 5, 10, 19, 11, 3, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[7];
cx q[10], q[8];
cx q[6], q[13];
cx q[13], q[14];
