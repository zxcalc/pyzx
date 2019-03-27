// Initial wiring: [6, 0, 1, 5, 7, 3, 2, 4, 8]
// Resulting wiring: [6, 0, 1, 5, 7, 3, 2, 4, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[0];
cx q[5], q[3];
cx q[3], q[4];
