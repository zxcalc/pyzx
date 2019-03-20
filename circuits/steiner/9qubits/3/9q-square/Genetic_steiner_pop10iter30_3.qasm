// Initial wiring: [2, 4, 1, 7, 5, 3, 8, 6, 0]
// Resulting wiring: [2, 4, 1, 7, 5, 3, 8, 6, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[5], q[6];
cx q[7], q[4];
