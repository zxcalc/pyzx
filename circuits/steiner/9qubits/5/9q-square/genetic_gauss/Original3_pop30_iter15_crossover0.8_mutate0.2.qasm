// Initial wiring: [5, 7, 4, 8, 6, 0, 3, 1, 2]
// Resulting wiring: [5, 7, 4, 8, 6, 0, 3, 1, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[4];
cx q[6], q[8];
cx q[4], q[8];
cx q[1], q[8];
cx q[0], q[2];
