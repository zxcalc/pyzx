// Initial wiring: [19, 0, 16, 5, 11, 17, 8, 14, 2, 6, 9, 7, 13, 10, 4, 3, 18, 15, 12, 1]
// Resulting wiring: [19, 0, 16, 5, 11, 17, 8, 14, 2, 6, 9, 7, 13, 10, 4, 3, 18, 15, 12, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[11], q[8];
cx q[15], q[14];
cx q[17], q[16];
