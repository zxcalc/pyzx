// Initial wiring: [3, 2, 4, 7, 8, 5, 6, 1, 0]
// Resulting wiring: [3, 2, 4, 7, 8, 5, 6, 1, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[1], q[4];
cx q[7], q[4];
