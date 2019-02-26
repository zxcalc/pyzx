// Initial wiring: [1, 5, 8, 4, 6, 0, 2, 3, 7]
// Resulting wiring: [1, 5, 8, 4, 6, 0, 2, 3, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[3], q[8];
cx q[3], q[2];
