// Initial wiring: [5, 4, 6, 8, 1, 3, 2, 0, 7]
// Resulting wiring: [5, 4, 6, 8, 1, 3, 2, 0, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[3], q[4];
cx q[0], q[5];
cx q[7], q[6];
cx q[3], q[2];
