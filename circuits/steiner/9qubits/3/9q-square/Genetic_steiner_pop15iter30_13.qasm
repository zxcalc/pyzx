// Initial wiring: [8, 7, 0, 3, 5, 4, 6, 2, 1]
// Resulting wiring: [8, 7, 0, 3, 5, 4, 6, 2, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[0], q[5];
cx q[7], q[8];
