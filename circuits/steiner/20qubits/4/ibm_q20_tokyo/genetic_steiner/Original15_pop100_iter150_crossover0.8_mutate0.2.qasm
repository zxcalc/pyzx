// Initial wiring: [5, 15, 1, 19, 9, 17, 0, 18, 7, 2, 8, 13, 10, 12, 4, 16, 14, 6, 3, 11]
// Resulting wiring: [5, 15, 1, 19, 9, 17, 0, 18, 7, 2, 8, 13, 10, 12, 4, 16, 14, 6, 3, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[15], q[16];
cx q[13], q[16];
cx q[11], q[12];
cx q[7], q[12];
