// Initial wiring: [6, 2, 8, 3, 0, 4, 1, 5, 7]
// Resulting wiring: [6, 2, 8, 3, 0, 4, 1, 5, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[2];
cx q[5], q[0];
cx q[6], q[3];
cx q[6], q[8];
cx q[0], q[7];
