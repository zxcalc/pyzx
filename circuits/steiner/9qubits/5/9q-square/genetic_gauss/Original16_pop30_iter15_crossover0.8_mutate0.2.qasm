// Initial wiring: [2, 0, 4, 1, 5, 3, 7, 6, 8]
// Resulting wiring: [2, 0, 4, 1, 5, 3, 7, 6, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[0];
cx q[5], q[6];
cx q[1], q[6];
cx q[0], q[5];
cx q[0], q[1];
