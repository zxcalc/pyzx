// Initial wiring: [2, 4, 6, 7, 1, 3, 0, 5, 8]
// Resulting wiring: [2, 4, 6, 7, 1, 3, 0, 5, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[3], q[2];
cx q[1], q[0];
