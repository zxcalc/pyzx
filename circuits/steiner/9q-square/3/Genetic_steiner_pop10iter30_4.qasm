// Initial wiring: [5, 8, 4, 7, 6, 2, 1, 3, 0]
// Resulting wiring: [5, 8, 4, 7, 6, 2, 1, 3, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[2], q[3];
cx q[2], q[1];
