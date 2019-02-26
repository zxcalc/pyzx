// Initial wiring: [8, 1, 5, 3, 6, 7, 4, 0, 2]
// Resulting wiring: [8, 1, 5, 3, 6, 7, 4, 0, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[0];
cx q[4], q[1];
cx q[2], q[1];
