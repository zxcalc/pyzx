// Initial wiring: [7, 4, 1, 2, 8, 5, 0, 3, 6]
// Resulting wiring: [7, 4, 1, 2, 8, 5, 0, 3, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[4];
cx q[5], q[4];
cx q[1], q[0];
