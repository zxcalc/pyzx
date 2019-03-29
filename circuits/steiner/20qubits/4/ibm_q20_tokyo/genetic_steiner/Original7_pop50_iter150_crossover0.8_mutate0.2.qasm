// Initial wiring: [0, 10, 1, 7, 13, 9, 18, 11, 5, 2, 3, 16, 12, 6, 4, 8, 19, 14, 15, 17]
// Resulting wiring: [0, 10, 1, 7, 13, 9, 18, 11, 5, 2, 3, 16, 12, 6, 4, 8, 19, 14, 15, 17]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[2];
cx q[12], q[7];
cx q[15], q[13];
cx q[8], q[10];
