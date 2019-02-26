// Initial wiring: [5, 6, 3, 2, 1, 8, 4, 7, 0]
// Resulting wiring: [5, 6, 3, 2, 1, 8, 4, 7, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[2];
cx q[1], q[0];
cx q[4], q[1];
