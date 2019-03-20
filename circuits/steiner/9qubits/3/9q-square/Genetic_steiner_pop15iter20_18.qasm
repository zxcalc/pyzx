// Initial wiring: [3, 1, 7, 4, 0, 2, 8, 6, 5]
// Resulting wiring: [3, 1, 7, 4, 0, 2, 8, 6, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[4], q[3];
cx q[3], q[2];
