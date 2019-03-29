// Initial wiring: [8, 6, 11, 10, 0, 1, 15, 4, 17, 16, 12, 13, 14, 2, 5, 7, 9, 19, 3, 18]
// Resulting wiring: [8, 6, 11, 10, 0, 1, 15, 4, 17, 16, 12, 13, 14, 2, 5, 7, 9, 19, 3, 18]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[6];
cx q[13], q[12];
cx q[16], q[15];
cx q[11], q[18];
