// Initial wiring: [14, 12, 17, 10, 13, 18, 9, 11, 1, 6, 16, 8, 7, 3, 19, 2, 5, 4, 15, 0]
// Resulting wiring: [14, 12, 17, 10, 13, 18, 9, 11, 1, 6, 16, 8, 7, 3, 19, 2, 5, 4, 15, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[11], q[9];
cx q[16], q[13];
cx q[7], q[8];
cx q[1], q[7];
