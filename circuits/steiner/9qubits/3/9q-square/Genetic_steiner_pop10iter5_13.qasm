// Initial wiring: [8, 4, 7, 1, 0, 6, 3, 5, 2]
// Resulting wiring: [8, 4, 7, 1, 0, 6, 3, 5, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[0], q[1];
cx q[1], q[2];
cx q[8], q[3];
