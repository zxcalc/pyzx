// Initial wiring: [3, 1, 6, 4, 5, 8, 2, 7, 0]
// Resulting wiring: [3, 1, 6, 4, 5, 8, 2, 7, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[4];
cx q[0], q[1];
cx q[7], q[8];
cx q[8], q[3];
