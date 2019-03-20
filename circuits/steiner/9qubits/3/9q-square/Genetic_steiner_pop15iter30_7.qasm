// Initial wiring: [6, 2, 8, 1, 4, 0, 3, 5, 7]
// Resulting wiring: [6, 2, 8, 1, 4, 0, 3, 5, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[7];
cx q[7], q[8];
cx q[5], q[0];
