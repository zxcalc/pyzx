// Initial wiring: [14, 12, 7, 3, 0, 4, 2, 13, 11, 10, 1, 6, 5, 8, 15, 9]
// Resulting wiring: [14, 12, 7, 3, 0, 4, 2, 13, 11, 10, 1, 6, 5, 8, 15, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[11], q[12];
cx q[6], q[7];
cx q[2], q[5];
cx q[0], q[1];
cx q[1], q[2];
cx q[2], q[5];
cx q[5], q[2];
