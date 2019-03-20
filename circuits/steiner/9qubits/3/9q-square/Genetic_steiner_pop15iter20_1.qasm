// Initial wiring: [4, 2, 5, 7, 8, 1, 3, 0, 6]
// Resulting wiring: [4, 2, 5, 7, 8, 1, 3, 0, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[1], q[4];
cx q[5], q[4];
