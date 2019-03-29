// Initial wiring: [18, 2, 19, 0, 12, 14, 6, 9, 17, 4, 13, 11, 3, 16, 7, 1, 10, 15, 5, 8]
// Resulting wiring: [18, 2, 19, 0, 12, 14, 6, 9, 17, 4, 13, 11, 3, 16, 7, 1, 10, 15, 5, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[3];
cx q[8], q[1];
cx q[11], q[9];
cx q[7], q[13];
