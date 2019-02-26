// Initial wiring: [1, 5, 8, 7, 2, 3, 4, 6, 0]
// Resulting wiring: [1, 5, 8, 7, 2, 3, 4, 6, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[0], q[5];
cx q[7], q[8];
