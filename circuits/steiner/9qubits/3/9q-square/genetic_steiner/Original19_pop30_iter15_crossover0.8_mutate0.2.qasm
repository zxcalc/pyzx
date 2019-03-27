// Initial wiring: [4, 2, 7, 0, 5, 6, 3, 8, 1]
// Resulting wiring: [4, 2, 7, 0, 5, 6, 3, 8, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[2];
cx q[5], q[4];
cx q[3], q[4];
