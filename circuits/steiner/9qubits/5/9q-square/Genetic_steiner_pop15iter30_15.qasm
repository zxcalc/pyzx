// Initial wiring: [8, 0, 2, 3, 1, 6, 4, 7, 5]
// Resulting wiring: [8, 0, 2, 3, 1, 6, 4, 7, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[0], q[5];
cx q[6], q[7];
cx q[5], q[4];
cx q[2], q[1];
