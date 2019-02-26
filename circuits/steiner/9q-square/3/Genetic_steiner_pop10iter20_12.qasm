// Initial wiring: [2, 8, 5, 1, 4, 3, 6, 7, 0]
// Resulting wiring: [2, 8, 5, 1, 4, 3, 6, 7, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[1];
cx q[5], q[0];
cx q[6], q[5];
