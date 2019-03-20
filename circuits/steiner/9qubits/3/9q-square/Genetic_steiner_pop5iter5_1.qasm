// Initial wiring: [6, 7, 0, 1, 8, 4, 5, 2, 3]
// Resulting wiring: [6, 7, 0, 1, 8, 4, 5, 2, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[1], q[4];
cx q[7], q[4];
