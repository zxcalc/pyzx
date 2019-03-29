// Initial wiring: [14, 6, 15, 2, 12, 1, 7, 11, 10, 5, 4, 13, 8, 0, 3, 9]
// Resulting wiring: [14, 6, 15, 2, 12, 1, 7, 11, 10, 5, 4, 13, 8, 0, 3, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[7], q[0];
cx q[9], q[8];
cx q[8], q[7];
cx q[11], q[10];
cx q[7], q[8];
