// Initial wiring: [4, 7, 5, 1, 8, 2, 6, 0, 3]
// Resulting wiring: [4, 7, 5, 1, 8, 2, 6, 0, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[1], q[4];
cx q[5], q[4];
