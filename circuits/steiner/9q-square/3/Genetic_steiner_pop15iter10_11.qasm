// Initial wiring: [8, 3, 6, 4, 0, 1, 7, 5, 2]
// Resulting wiring: [8, 3, 6, 4, 0, 1, 7, 5, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[0];
cx q[4], q[1];
cx q[2], q[1];
