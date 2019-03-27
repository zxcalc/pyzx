// Initial wiring: [4, 2, 6, 0, 5, 1, 8, 3, 7]
// Resulting wiring: [4, 2, 6, 0, 5, 1, 8, 3, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[5];
cx q[7], q[6];
cx q[6], q[1];
cx q[7], q[2];
cx q[1], q[6];
