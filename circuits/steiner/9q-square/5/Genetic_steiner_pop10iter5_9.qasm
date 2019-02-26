// Initial wiring: [5, 2, 4, 1, 6, 3, 0, 8, 7]
// Resulting wiring: [5, 2, 4, 1, 6, 3, 0, 8, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[6];
cx q[7], q[8];
cx q[4], q[7];
cx q[1], q[4];
cx q[7], q[8];
cx q[3], q[2];
