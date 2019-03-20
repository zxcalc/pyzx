// Initial wiring: [3, 5, 7, 8, 0, 6, 1, 2, 4]
// Resulting wiring: [3, 5, 7, 8, 0, 6, 1, 2, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[1], q[2];
cx q[4], q[5];
