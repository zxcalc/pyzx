// Initial wiring: [2, 3, 6, 5, 1, 8, 7, 0, 4]
// Resulting wiring: [2, 3, 6, 5, 1, 8, 7, 0, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[1], q[4];
cx q[0], q[5];
