// Initial wiring: [8, 1, 7, 2, 6, 3, 4, 0, 5]
// Resulting wiring: [8, 1, 7, 2, 6, 3, 4, 0, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[4];
cx q[5], q[0];
cx q[4], q[5];
cx q[7], q[4];
