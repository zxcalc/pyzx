// Initial wiring: [9, 11, 14, 5, 1, 19, 16, 8, 17, 4, 12, 13, 15, 0, 6, 7, 3, 18, 2, 10]
// Resulting wiring: [9, 11, 14, 5, 1, 19, 16, 8, 17, 4, 12, 13, 15, 0, 6, 7, 3, 18, 2, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[3];
cx q[13], q[16];
cx q[11], q[18];
cx q[1], q[8];
