// Initial wiring: [8, 5, 4, 7, 6, 1, 0, 2, 3]
// Resulting wiring: [8, 5, 4, 7, 6, 1, 0, 2, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[8];
cx q[4], q[1];
cx q[5], q[4];
