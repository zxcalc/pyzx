// Initial wiring: [4, 1, 8, 3, 2, 7, 0, 6, 5]
// Resulting wiring: [4, 1, 8, 3, 2, 7, 0, 6, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[1], q[2];
cx q[1], q[4];
cx q[2], q[1];
