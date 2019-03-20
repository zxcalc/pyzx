// Initial wiring: [2, 1, 0, 8, 6, 4, 5, 3, 7]
// Resulting wiring: [2, 1, 0, 8, 6, 4, 5, 3, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[3], q[4];
cx q[6], q[7];
cx q[6], q[5];
cx q[2], q[1];
cx q[3], q[2];
cx q[1], q[0];
cx q[2], q[1];
cx q[1], q[2];
