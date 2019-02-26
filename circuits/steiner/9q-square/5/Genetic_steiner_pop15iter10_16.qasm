// Initial wiring: [4, 1, 6, 0, 2, 8, 5, 3, 7]
// Resulting wiring: [4, 1, 6, 0, 2, 8, 5, 3, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[4];
cx q[7], q[8];
cx q[4], q[7];
cx q[3], q[8];
cx q[4], q[3];
