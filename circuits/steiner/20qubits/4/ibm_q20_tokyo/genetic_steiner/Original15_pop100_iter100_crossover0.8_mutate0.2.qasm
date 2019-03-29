// Initial wiring: [8, 13, 1, 2, 0, 3, 12, 16, 10, 9, 5, 18, 14, 6, 4, 11, 19, 15, 17, 7]
// Resulting wiring: [8, 13, 1, 2, 0, 3, 12, 16, 10, 9, 5, 18, 14, 6, 4, 11, 19, 15, 17, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[11], q[8];
cx q[7], q[12];
cx q[6], q[12];
cx q[1], q[8];
