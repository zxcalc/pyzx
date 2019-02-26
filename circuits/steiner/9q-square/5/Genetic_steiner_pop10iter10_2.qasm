// Initial wiring: [3, 1, 2, 6, 8, 4, 7, 5, 0]
// Resulting wiring: [3, 1, 2, 6, 8, 4, 7, 5, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[1], q[4];
cx q[4], q[1];
cx q[1], q[0];
