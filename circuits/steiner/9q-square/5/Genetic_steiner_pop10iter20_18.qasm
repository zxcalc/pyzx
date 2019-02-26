// Initial wiring: [6, 0, 7, 2, 8, 3, 4, 1, 5]
// Resulting wiring: [6, 0, 7, 2, 8, 3, 4, 1, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[7];
cx q[5], q[4];
cx q[4], q[3];
cx q[3], q[4];
cx q[5], q[0];
