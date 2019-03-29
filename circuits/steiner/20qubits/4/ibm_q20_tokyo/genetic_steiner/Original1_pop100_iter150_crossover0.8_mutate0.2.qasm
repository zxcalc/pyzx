// Initial wiring: [4, 10, 3, 1, 9, 11, 2, 14, 7, 12, 6, 15, 8, 17, 18, 13, 5, 0, 19, 16]
// Resulting wiring: [4, 10, 3, 1, 9, 11, 2, 14, 7, 12, 6, 15, 8, 17, 18, 13, 5, 0, 19, 16]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[7];
cx q[9], q[10];
cx q[6], q[13];
cx q[1], q[7];
