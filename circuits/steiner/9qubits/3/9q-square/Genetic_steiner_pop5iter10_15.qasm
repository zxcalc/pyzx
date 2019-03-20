// Initial wiring: [8, 6, 4, 1, 2, 5, 7, 0, 3]
// Resulting wiring: [8, 6, 4, 1, 2, 5, 7, 0, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[0], q[5];
cx q[3], q[8];
cx q[2], q[3];
cx q[3], q[8];
cx q[8], q[3];
