// Initial wiring: [7, 4, 18, 9, 5, 8, 12, 0, 10, 13, 15, 19, 6, 14, 2, 1, 16, 11, 3, 17]
// Resulting wiring: [7, 4, 18, 9, 5, 8, 12, 0, 10, 13, 15, 19, 6, 14, 2, 1, 16, 11, 3, 17]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[8];
cx q[16], q[13];
cx q[6], q[13];
cx q[2], q[8];
