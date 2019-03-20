// Initial wiring: [0, 6, 8, 5, 4, 3, 7, 1, 2]
// Resulting wiring: [0, 6, 8, 5, 4, 3, 7, 1, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[4], q[5];
cx q[1], q[4];
cx q[0], q[5];
cx q[5], q[6];
