// Initial wiring: [4, 0, 7, 6, 3, 1, 5, 8, 2]
// Resulting wiring: [4, 0, 7, 6, 3, 1, 5, 8, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[7];
cx q[3], q[4];
cx q[1], q[4];
