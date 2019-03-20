// Initial wiring: [4, 5, 3, 1, 8, 2, 0, 7, 6]
// Resulting wiring: [4, 5, 3, 1, 8, 2, 0, 7, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[7], q[4];
cx q[5], q[4];
