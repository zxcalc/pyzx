// Initial wiring: [8, 0, 4, 3, 2, 7, 6, 1, 5]
// Resulting wiring: [8, 0, 4, 3, 2, 7, 6, 1, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[1], q[2];
cx q[0], q[1];
cx q[1], q[2];
cx q[0], q[5];
cx q[4], q[7];
