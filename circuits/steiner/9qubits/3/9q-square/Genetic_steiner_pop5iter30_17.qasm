// Initial wiring: [8, 4, 6, 3, 2, 7, 5, 1, 0]
// Resulting wiring: [8, 4, 6, 3, 2, 7, 5, 1, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[1], q[4];
cx q[6], q[5];
