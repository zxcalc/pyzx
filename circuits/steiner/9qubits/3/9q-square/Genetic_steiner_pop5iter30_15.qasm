// Initial wiring: [5, 8, 2, 1, 3, 4, 0, 7, 6]
// Resulting wiring: [5, 8, 2, 1, 3, 4, 0, 7, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[4];
cx q[4], q[3];
cx q[1], q[0];
