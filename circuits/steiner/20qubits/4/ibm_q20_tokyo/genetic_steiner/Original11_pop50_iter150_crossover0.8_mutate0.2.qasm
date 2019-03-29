// Initial wiring: [14, 17, 1, 9, 2, 18, 13, 15, 11, 5, 6, 16, 10, 0, 4, 3, 8, 19, 12, 7]
// Resulting wiring: [14, 17, 1, 9, 2, 18, 13, 15, 11, 5, 6, 16, 10, 0, 4, 3, 8, 19, 12, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[8], q[1];
cx q[11], q[9];
cx q[13], q[15];
