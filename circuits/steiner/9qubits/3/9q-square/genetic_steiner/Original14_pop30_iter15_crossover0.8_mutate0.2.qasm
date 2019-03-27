// Initial wiring: [8, 4, 3, 7, 5, 0, 6, 1, 2]
// Resulting wiring: [8, 4, 3, 7, 5, 0, 6, 1, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[5];
cx q[1], q[4];
cx q[1], q[2];
