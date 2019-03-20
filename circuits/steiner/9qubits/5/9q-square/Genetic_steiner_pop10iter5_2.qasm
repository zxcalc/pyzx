// Initial wiring: [8, 3, 5, 7, 2, 1, 4, 0, 6]
// Resulting wiring: [8, 3, 5, 7, 2, 1, 4, 0, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[5], q[4];
cx q[5], q[0];
cx q[0], q[5];
