// Initial wiring: [4, 0, 5, 7, 1, 8, 6, 2, 3]
// Resulting wiring: [4, 0, 5, 7, 1, 8, 6, 2, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[0];
cx q[0], q[3];
cx q[1], q[7];
