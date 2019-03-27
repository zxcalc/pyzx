// Initial wiring: [3, 0, 8, 4, 1, 6, 2, 5, 7]
// Resulting wiring: [3, 0, 8, 4, 1, 6, 2, 5, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[0];
cx q[1], q[2];
cx q[0], q[3];
cx q[4], q[8];
cx q[1], q[6];
