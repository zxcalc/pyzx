// Initial wiring: [1, 5, 8, 0, 6, 2, 4, 3, 7]
// Resulting wiring: [1, 5, 8, 0, 6, 2, 4, 3, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[3], q[8];
cx q[4], q[1];
cx q[3], q[4];
