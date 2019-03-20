// Initial wiring: [1, 0, 4, 6, 3, 2, 8, 5, 7]
// Resulting wiring: [1, 0, 4, 6, 3, 2, 8, 5, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[6];
cx q[6], q[5];
cx q[5], q[6];
cx q[4], q[3];
cx q[5], q[0];
cx q[6], q[5];
cx q[4], q[5];
