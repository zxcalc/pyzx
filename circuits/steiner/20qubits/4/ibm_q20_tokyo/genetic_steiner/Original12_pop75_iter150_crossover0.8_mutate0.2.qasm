// Initial wiring: [10, 4, 18, 3, 7, 17, 6, 14, 9, 19, 0, 11, 1, 5, 2, 8, 15, 16, 13, 12]
// Resulting wiring: [10, 4, 18, 3, 7, 17, 6, 14, 9, 19, 0, 11, 1, 5, 2, 8, 15, 16, 13, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[11], q[8];
cx q[12], q[13];
cx q[4], q[6];
cx q[2], q[8];
