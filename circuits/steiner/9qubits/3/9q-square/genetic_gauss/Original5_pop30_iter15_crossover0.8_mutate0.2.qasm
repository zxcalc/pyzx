// Initial wiring: [8, 0, 5, 7, 6, 1, 2, 4, 3]
// Resulting wiring: [8, 0, 5, 7, 6, 1, 2, 4, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[1];
cx q[5], q[2];
cx q[5], q[8];
