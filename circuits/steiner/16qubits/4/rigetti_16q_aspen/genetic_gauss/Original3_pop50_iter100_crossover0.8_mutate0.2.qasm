// Initial wiring: [4, 12, 2, 14, 11, 3, 8, 5, 7, 13, 0, 15, 6, 1, 9, 10]
// Resulting wiring: [4, 12, 2, 14, 11, 3, 8, 5, 7, 13, 0, 15, 6, 1, 9, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[11], q[2];
cx q[13], q[3];
cx q[7], q[8];
