// Initial wiring: [14, 6, 3, 17, 2, 15, 19, 5, 0, 1, 4, 13, 7, 16, 10, 8, 18, 12, 9, 11]
// Resulting wiring: [14, 6, 3, 17, 2, 15, 19, 5, 0, 1, 4, 13, 7, 16, 10, 8, 18, 12, 9, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[9], q[8];
cx q[13], q[12];
cx q[3], q[5];
