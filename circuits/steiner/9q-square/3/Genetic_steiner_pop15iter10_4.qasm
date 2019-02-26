// Initial wiring: [5, 0, 3, 6, 4, 8, 1, 7, 2]
// Resulting wiring: [5, 0, 3, 6, 4, 8, 1, 7, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[0], q[5];
cx q[4], q[7];
