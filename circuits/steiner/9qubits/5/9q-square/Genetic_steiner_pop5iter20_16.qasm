// Initial wiring: [2, 1, 0, 3, 7, 5, 4, 8, 6]
// Resulting wiring: [2, 1, 0, 3, 7, 5, 4, 8, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[2], q[3];
cx q[1], q[2];
cx q[0], q[1];
cx q[3], q[4];
cx q[2], q[3];
cx q[1], q[0];
