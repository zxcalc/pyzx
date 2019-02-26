// Initial wiring: [2, 8, 0, 7, 4, 5, 3, 1, 6]
// Resulting wiring: [2, 8, 0, 7, 4, 5, 3, 1, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[3];
cx q[5], q[4];
cx q[4], q[1];
cx q[5], q[4];
