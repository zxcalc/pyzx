// Initial wiring: [1, 2, 0, 4, 3, 5, 8, 6, 7]
// Resulting wiring: [1, 2, 0, 4, 3, 5, 8, 6, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[3], q[8];
cx q[2], q[1];
