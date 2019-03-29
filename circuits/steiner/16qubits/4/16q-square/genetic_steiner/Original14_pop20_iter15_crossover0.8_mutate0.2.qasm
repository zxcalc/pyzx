// Initial wiring: [8, 10, 4, 1, 5, 12, 6, 14, 13, 0, 3, 11, 7, 15, 2, 9]
// Resulting wiring: [8, 10, 4, 1, 5, 12, 6, 14, 13, 0, 3, 11, 7, 15, 2, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[6], q[1];
cx q[11], q[10];
cx q[13], q[12];
