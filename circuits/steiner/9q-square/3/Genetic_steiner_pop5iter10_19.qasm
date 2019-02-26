// Initial wiring: [1, 7, 2, 4, 0, 5, 6, 8, 3]
// Resulting wiring: [1, 7, 2, 4, 0, 5, 6, 8, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[6], q[5];
cx q[4], q[1];
