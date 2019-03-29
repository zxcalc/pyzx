// Initial wiring: [12, 18, 8, 4, 19, 15, 13, 14, 2, 16, 3, 7, 1, 0, 5, 9, 11, 10, 6, 17]
// Resulting wiring: [12, 18, 8, 4, 19, 15, 13, 14, 2, 16, 3, 7, 1, 0, 5, 9, 11, 10, 6, 17]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[5];
cx q[8], q[7];
cx q[15], q[11];
cx q[6], q[10];
