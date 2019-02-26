// Initial wiring: [6, 3, 1, 5, 2, 7, 4, 8, 0]
// Resulting wiring: [6, 3, 1, 5, 2, 7, 4, 8, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[4];
cx q[0], q[1];
cx q[6], q[7];
