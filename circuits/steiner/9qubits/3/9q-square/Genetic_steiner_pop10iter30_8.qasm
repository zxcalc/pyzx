// Initial wiring: [3, 5, 8, 0, 4, 2, 1, 6, 7]
// Resulting wiring: [3, 5, 8, 0, 4, 2, 1, 6, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[4], q[7];
cx q[4], q[1];
