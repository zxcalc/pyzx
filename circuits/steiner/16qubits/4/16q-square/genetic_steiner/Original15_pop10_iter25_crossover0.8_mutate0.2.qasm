// Initial wiring: [15, 13, 7, 3, 8, 4, 12, 9, 0, 2, 5, 10, 1, 6, 14, 11]
// Resulting wiring: [15, 13, 7, 3, 8, 4, 12, 9, 0, 2, 5, 10, 1, 6, 14, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[9], q[6];
cx q[6], q[1];
cx q[13], q[10];
cx q[14], q[9];
cx q[9], q[6];
cx q[6], q[5];
cx q[14], q[9];
