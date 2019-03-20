// Initial wiring: [3, 4, 1, 0, 7, 6, 8, 5, 2]
// Resulting wiring: [3, 4, 1, 0, 7, 6, 8, 5, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[0], q[5];
cx q[3], q[8];
cx q[5], q[4];
cx q[4], q[1];
