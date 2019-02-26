// Initial wiring: [5, 2, 3, 6, 4, 7, 8, 1, 0]
// Resulting wiring: [5, 2, 3, 6, 4, 7, 8, 1, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[2], q[3];
cx q[1], q[2];
cx q[0], q[1];
cx q[1], q[2];
cx q[2], q[3];
cx q[1], q[4];
cx q[0], q[1];
cx q[1], q[4];
cx q[6], q[5];
cx q[2], q[1];
cx q[3], q[2];
