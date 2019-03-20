// Initial wiring: [5, 2, 3, 1, 4, 7, 8, 0, 6]
// Resulting wiring: [5, 2, 3, 1, 4, 7, 8, 0, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[5];
cx q[4], q[1];
cx q[2], q[1];
