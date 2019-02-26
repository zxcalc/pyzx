// Initial wiring: [2, 0, 8, 6, 7, 4, 5, 3, 1]
// Resulting wiring: [2, 0, 8, 6, 7, 4, 5, 3, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[4];
cx q[4], q[3];
cx q[5], q[4];
cx q[5], q[0];
