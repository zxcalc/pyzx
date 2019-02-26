// Initial wiring: [5, 6, 0, 7, 1, 4, 3, 8, 2]
// Resulting wiring: [5, 6, 0, 7, 1, 4, 3, 8, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[4], q[7];
cx q[1], q[4];
cx q[0], q[1];
