// Initial wiring: [12, 10, 1, 15, 0, 3, 2, 14, 7, 5, 6, 11, 4, 13, 8, 9]
// Resulting wiring: [12, 10, 1, 15, 0, 3, 2, 14, 7, 5, 6, 11, 4, 13, 8, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[7], q[0];
cx q[13], q[12];
cx q[11], q[12];
