// Initial wiring: [2, 8, 0, 1, 3, 6, 4, 7, 5]
// Resulting wiring: [2, 8, 0, 1, 3, 6, 4, 7, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[4], q[5];
cx q[4], q[3];
