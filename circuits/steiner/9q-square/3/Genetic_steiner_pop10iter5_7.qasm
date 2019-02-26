// Initial wiring: [3, 5, 7, 4, 8, 6, 0, 1, 2]
// Resulting wiring: [3, 5, 7, 4, 8, 6, 0, 1, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[1], q[2];
cx q[6], q[5];
