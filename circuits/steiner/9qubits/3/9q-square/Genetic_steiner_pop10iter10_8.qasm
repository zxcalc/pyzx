// Initial wiring: [5, 4, 6, 8, 2, 7, 1, 3, 0]
// Resulting wiring: [5, 4, 6, 8, 2, 7, 1, 3, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[1], q[4];
cx q[1], q[0];
