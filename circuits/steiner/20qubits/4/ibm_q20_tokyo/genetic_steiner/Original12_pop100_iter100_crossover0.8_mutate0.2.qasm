// Initial wiring: [16, 8, 19, 4, 18, 9, 7, 12, 5, 15, 2, 1, 6, 13, 11, 17, 14, 0, 10, 3]
// Resulting wiring: [16, 8, 19, 4, 18, 9, 7, 12, 5, 15, 2, 1, 6, 13, 11, 17, 14, 0, 10, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[11], q[8];
cx q[14], q[5];
cx q[6], q[12];
cx q[4], q[5];
