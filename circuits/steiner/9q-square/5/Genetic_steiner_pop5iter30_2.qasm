// Initial wiring: [6, 2, 7, 8, 1, 5, 4, 0, 3]
// Resulting wiring: [6, 2, 7, 8, 1, 5, 4, 0, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[8];
cx q[4], q[3];
cx q[4], q[1];
cx q[3], q[4];
