// Initial wiring: [3, 6, 2, 0, 5, 8, 1, 7, 4]
// Resulting wiring: [3, 6, 2, 0, 5, 8, 1, 7, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[4];
cx q[1], q[4];
cx q[0], q[5];
