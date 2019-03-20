// Initial wiring: [6, 0, 7, 4, 1, 2, 3, 8, 5]
// Resulting wiring: [6, 0, 7, 4, 1, 2, 3, 8, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[6];
cx q[4], q[5];
cx q[5], q[6];
cx q[4], q[7];
cx q[7], q[6];
cx q[7], q[4];
