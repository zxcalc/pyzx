// Initial wiring: [2, 7, 0, 3, 1, 8, 4, 5, 6]
// Resulting wiring: [2, 7, 0, 3, 1, 8, 4, 5, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[5], q[4];
cx q[4], q[5];
cx q[4], q[3];
cx q[5], q[0];
cx q[4], q[5];
