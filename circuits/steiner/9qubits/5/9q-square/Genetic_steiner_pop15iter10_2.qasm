// Initial wiring: [6, 8, 3, 4, 1, 7, 5, 2, 0]
// Resulting wiring: [6, 8, 3, 4, 1, 7, 5, 2, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[4], q[7];
cx q[4], q[1];
cx q[1], q[4];
