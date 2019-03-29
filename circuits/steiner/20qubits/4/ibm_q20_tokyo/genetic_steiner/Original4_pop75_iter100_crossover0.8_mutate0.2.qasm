// Initial wiring: [18, 0, 16, 19, 4, 7, 11, 17, 10, 2, 6, 5, 15, 1, 13, 3, 9, 8, 14, 12]
// Resulting wiring: [18, 0, 16, 19, 4, 7, 11, 17, 10, 2, 6, 5, 15, 1, 13, 3, 9, 8, 14, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[1];
cx q[11], q[9];
cx q[12], q[13];
cx q[2], q[8];
