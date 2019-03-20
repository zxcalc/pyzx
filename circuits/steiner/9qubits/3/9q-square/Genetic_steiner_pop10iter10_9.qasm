// Initial wiring: [0, 7, 2, 4, 6, 1, 3, 5, 8]
// Resulting wiring: [0, 7, 2, 4, 6, 1, 3, 5, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[1], q[4];
cx q[3], q[2];
