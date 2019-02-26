// Initial wiring: [2, 4, 1, 8, 7, 3, 0, 5, 6]
// Resulting wiring: [2, 4, 1, 8, 7, 3, 0, 5, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[4];
cx q[5], q[0];
cx q[1], q[0];
