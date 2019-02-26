// Initial wiring: [5, 4, 7, 2, 6, 1, 0, 8, 3]
// Resulting wiring: [5, 4, 7, 2, 6, 1, 0, 8, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[2], q[3];
cx q[5], q[4];
cx q[8], q[3];
cx q[4], q[3];
