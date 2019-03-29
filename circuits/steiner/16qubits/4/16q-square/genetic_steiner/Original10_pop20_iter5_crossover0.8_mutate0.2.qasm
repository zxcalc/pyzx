// Initial wiring: [14, 2, 3, 6, 13, 9, 1, 4, 8, 10, 5, 0, 11, 7, 15, 12]
// Resulting wiring: [14, 2, 3, 6, 13, 9, 1, 4, 8, 10, 5, 0, 11, 7, 15, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[5], q[4];
cx q[6], q[5];
cx q[7], q[6];
cx q[8], q[7];
cx q[7], q[6];
cx q[5], q[6];
