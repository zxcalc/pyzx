// Initial wiring: [8, 3, 1, 5, 7, 0, 2, 4, 6]
// Resulting wiring: [8, 3, 1, 5, 7, 0, 2, 4, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[3];
cx q[4], q[3];
cx q[1], q[0];
