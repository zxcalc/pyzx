// Initial wiring: [4, 3, 0, 8, 5, 1, 6, 7, 2]
// Resulting wiring: [4, 3, 0, 8, 5, 1, 6, 7, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[4];
cx q[0], q[8];
cx q[0], q[6];
