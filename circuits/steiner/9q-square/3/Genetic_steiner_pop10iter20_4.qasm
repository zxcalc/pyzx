// Initial wiring: [0, 3, 7, 4, 8, 5, 1, 2, 6]
// Resulting wiring: [0, 3, 7, 4, 8, 5, 1, 2, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[5], q[4];
cx q[3], q[2];
