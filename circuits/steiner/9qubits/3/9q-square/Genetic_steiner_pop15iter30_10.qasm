// Initial wiring: [8, 3, 0, 4, 6, 1, 5, 7, 2]
// Resulting wiring: [8, 3, 0, 4, 6, 1, 5, 7, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[0];
cx q[6], q[5];
cx q[4], q[5];
