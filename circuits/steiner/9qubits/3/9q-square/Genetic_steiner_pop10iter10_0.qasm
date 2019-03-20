// Initial wiring: [4, 2, 0, 8, 1, 6, 5, 7, 3]
// Resulting wiring: [4, 2, 0, 8, 1, 6, 5, 7, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[6];
cx q[7], q[4];
cx q[1], q[0];
