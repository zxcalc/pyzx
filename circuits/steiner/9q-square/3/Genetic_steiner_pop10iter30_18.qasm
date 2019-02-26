// Initial wiring: [2, 3, 8, 7, 4, 0, 6, 1, 5]
// Resulting wiring: [2, 3, 8, 7, 4, 0, 6, 1, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[4];
cx q[4], q[3];
cx q[5], q[0];
