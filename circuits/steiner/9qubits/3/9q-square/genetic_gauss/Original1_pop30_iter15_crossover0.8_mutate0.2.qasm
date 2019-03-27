// Initial wiring: [5, 0, 4, 3, 1, 6, 8, 2, 7]
// Resulting wiring: [5, 0, 4, 3, 1, 6, 8, 2, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[6];
cx q[8], q[6];
cx q[4], q[6];
