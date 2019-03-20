// Initial wiring: [3, 8, 4, 2, 6, 7, 0, 1, 5]
// Resulting wiring: [3, 8, 4, 2, 6, 7, 0, 1, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[2], q[3];
cx q[3], q[4];
cx q[5], q[4];
