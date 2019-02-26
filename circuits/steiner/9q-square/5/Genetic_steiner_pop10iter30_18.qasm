// Initial wiring: [1, 3, 8, 2, 6, 4, 0, 7, 5]
// Resulting wiring: [1, 3, 8, 2, 6, 4, 0, 7, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[2], q[3];
cx q[1], q[4];
cx q[2], q[1];
cx q[1], q[0];
cx q[2], q[1];
cx q[3], q[2];
