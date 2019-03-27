// Initial wiring: [3, 2, 0, 1, 6, 5, 7, 8, 4]
// Resulting wiring: [3, 2, 0, 1, 6, 5, 7, 8, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[0];
cx q[4], q[5];
cx q[3], q[4];
