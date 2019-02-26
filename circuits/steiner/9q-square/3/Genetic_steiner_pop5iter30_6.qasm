// Initial wiring: [0, 3, 1, 2, 6, 8, 7, 4, 5]
// Resulting wiring: [0, 3, 1, 2, 6, 8, 7, 4, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[3], q[4];
cx q[1], q[4];
cx q[4], q[5];
cx q[3], q[4];
cx q[4], q[5];
