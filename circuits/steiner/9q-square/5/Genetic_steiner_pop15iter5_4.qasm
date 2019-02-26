// Initial wiring: [3, 4, 6, 1, 5, 2, 0, 8, 7]
// Resulting wiring: [3, 4, 6, 1, 5, 2, 0, 8, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[1], q[2];
cx q[6], q[7];
cx q[3], q[8];
cx q[6], q[5];
cx q[2], q[1];
cx q[1], q[2];
cx q[1], q[0];
cx q[2], q[1];
cx q[1], q[2];
