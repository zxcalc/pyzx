// Initial wiring: [4, 5, 1, 8, 3, 2, 0, 6, 7]
// Resulting wiring: [4, 5, 1, 8, 3, 2, 0, 6, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[4], q[7];
cx q[1], q[4];
cx q[4], q[7];
cx q[3], q[8];
cx q[7], q[4];
cx q[1], q[0];
