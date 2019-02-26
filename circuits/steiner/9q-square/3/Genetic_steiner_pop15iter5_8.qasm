// Initial wiring: [2, 4, 6, 3, 5, 7, 0, 1, 8]
// Resulting wiring: [2, 4, 6, 3, 5, 7, 0, 1, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[1], q[4];
cx q[1], q[0];
