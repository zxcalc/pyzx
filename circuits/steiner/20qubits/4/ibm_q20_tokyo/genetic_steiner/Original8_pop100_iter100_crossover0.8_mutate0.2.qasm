// Initial wiring: [6, 14, 2, 1, 5, 10, 7, 0, 18, 8, 16, 3, 17, 15, 12, 9, 19, 13, 4, 11]
// Resulting wiring: [6, 14, 2, 1, 5, 10, 7, 0, 18, 8, 16, 3, 17, 15, 12, 9, 19, 13, 4, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[11], q[9];
cx q[12], q[7];
cx q[13], q[12];
cx q[13], q[6];
