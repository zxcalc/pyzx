// Initial wiring: [8, 2, 4, 1, 3, 0, 6, 5, 7]
// Resulting wiring: [8, 2, 4, 1, 3, 0, 6, 5, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[6];
cx q[4], q[7];
cx q[7], q[8];
