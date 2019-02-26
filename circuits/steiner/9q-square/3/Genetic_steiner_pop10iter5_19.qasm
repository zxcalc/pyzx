// Initial wiring: [4, 6, 3, 2, 5, 1, 7, 0, 8]
// Resulting wiring: [4, 6, 3, 2, 5, 1, 7, 0, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[4];
cx q[7], q[6];
cx q[7], q[4];
