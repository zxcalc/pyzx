// Initial wiring: [5, 8, 2, 1, 4, 7, 6, 3, 0]
// Resulting wiring: [5, 8, 2, 1, 4, 7, 6, 3, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[4], q[5];
cx q[4], q[1];
