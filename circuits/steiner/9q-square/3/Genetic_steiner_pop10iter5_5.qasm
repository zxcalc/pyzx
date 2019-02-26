// Initial wiring: [2, 3, 7, 5, 1, 8, 4, 6, 0]
// Resulting wiring: [2, 3, 7, 5, 1, 8, 4, 6, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[8];
cx q[4], q[3];
cx q[4], q[1];
