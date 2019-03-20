// Initial wiring: [4, 5, 0, 2, 3, 7, 8, 1, 6]
// Resulting wiring: [4, 5, 0, 2, 3, 7, 8, 1, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[8];
cx q[5], q[4];
cx q[4], q[3];
cx q[8], q[3];
cx q[5], q[4];
cx q[1], q[0];
