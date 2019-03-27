// Initial wiring: [2, 8, 4, 7, 5, 1, 0, 3, 6]
// Resulting wiring: [2, 8, 4, 7, 5, 1, 0, 3, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[1];
cx q[4], q[1];
cx q[2], q[3];
