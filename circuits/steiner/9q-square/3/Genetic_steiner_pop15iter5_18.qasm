// Initial wiring: [2, 0, 6, 8, 4, 7, 1, 3, 5]
// Resulting wiring: [2, 0, 6, 8, 4, 7, 1, 3, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[4];
cx q[4], q[5];
cx q[1], q[0];
