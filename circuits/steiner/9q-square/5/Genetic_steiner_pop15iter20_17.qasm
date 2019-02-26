// Initial wiring: [1, 3, 8, 6, 4, 2, 5, 0, 7]
// Resulting wiring: [1, 3, 8, 6, 4, 2, 5, 0, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[5];
cx q[5], q[6];
cx q[0], q[5];
cx q[5], q[6];
cx q[8], q[7];
cx q[7], q[4];
cx q[1], q[0];
