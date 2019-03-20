// Initial wiring: [3, 1, 8, 6, 7, 4, 5, 2, 0]
// Resulting wiring: [3, 1, 8, 6, 7, 4, 5, 2, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[6];
cx q[3], q[8];
cx q[5], q[0];
