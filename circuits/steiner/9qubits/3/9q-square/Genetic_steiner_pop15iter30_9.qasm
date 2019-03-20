// Initial wiring: [8, 6, 7, 1, 4, 2, 5, 3, 0]
// Resulting wiring: [8, 6, 7, 1, 4, 2, 5, 3, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[4], q[1];
cx q[2], q[1];
