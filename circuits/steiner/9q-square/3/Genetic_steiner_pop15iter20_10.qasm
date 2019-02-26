// Initial wiring: [4, 3, 7, 5, 1, 6, 0, 8, 2]
// Resulting wiring: [4, 3, 7, 5, 1, 6, 0, 8, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[7];
cx q[3], q[4];
cx q[5], q[4];
