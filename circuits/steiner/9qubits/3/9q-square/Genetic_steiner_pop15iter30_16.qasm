// Initial wiring: [3, 1, 2, 7, 6, 5, 0, 4, 8]
// Resulting wiring: [3, 1, 2, 7, 6, 5, 0, 4, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[8];
cx q[2], q[1];
cx q[5], q[0];
