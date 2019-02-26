// Initial wiring: [4, 2, 1, 6, 3, 0, 7, 5, 8]
// Resulting wiring: [4, 2, 1, 6, 3, 0, 7, 5, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[7], q[6];
cx q[4], q[1];
