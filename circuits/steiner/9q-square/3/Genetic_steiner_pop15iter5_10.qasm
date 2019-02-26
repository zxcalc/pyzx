// Initial wiring: [1, 8, 7, 3, 5, 6, 2, 0, 4]
// Resulting wiring: [1, 8, 7, 3, 5, 6, 2, 0, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[4], q[5];
cx q[5], q[0];
cx q[4], q[5];
