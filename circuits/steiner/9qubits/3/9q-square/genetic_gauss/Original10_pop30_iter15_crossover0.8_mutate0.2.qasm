// Initial wiring: [5, 2, 6, 1, 8, 4, 3, 7, 0]
// Resulting wiring: [5, 2, 6, 1, 8, 4, 3, 7, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[2], q[3];
cx q[0], q[3];
