// Initial wiring: [7, 3, 4, 8, 0, 2, 1, 5, 6]
// Resulting wiring: [7, 3, 4, 8, 0, 2, 1, 5, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[5];
cx q[4], q[1];
cx q[5], q[4];
cx q[1], q[0];
cx q[4], q[1];
