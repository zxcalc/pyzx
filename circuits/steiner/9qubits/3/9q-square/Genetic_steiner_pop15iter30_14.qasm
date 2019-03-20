// Initial wiring: [4, 5, 8, 0, 6, 3, 2, 7, 1]
// Resulting wiring: [4, 5, 8, 0, 6, 3, 2, 7, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[0], q[5];
cx q[4], q[3];
