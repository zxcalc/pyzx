// Initial wiring: [5, 1, 3, 2, 6, 8, 4, 0, 7]
// Resulting wiring: [5, 1, 3, 2, 6, 8, 4, 0, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[4], q[7];
cx q[1], q[0];
