// Initial wiring: [2, 1, 5, 0, 8, 7, 3, 4, 6]
// Resulting wiring: [2, 1, 5, 0, 8, 7, 3, 4, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[4], q[5];
cx q[4], q[7];
