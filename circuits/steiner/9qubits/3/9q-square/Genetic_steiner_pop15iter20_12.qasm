// Initial wiring: [2, 4, 1, 7, 8, 3, 6, 0, 5]
// Resulting wiring: [2, 4, 1, 7, 8, 3, 6, 0, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[4];
cx q[5], q[0];
cx q[6], q[5];
