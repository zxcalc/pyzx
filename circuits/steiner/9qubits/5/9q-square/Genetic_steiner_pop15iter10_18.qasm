// Initial wiring: [6, 3, 4, 0, 1, 7, 2, 8, 5]
// Resulting wiring: [6, 3, 4, 0, 1, 7, 2, 8, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[7];
cx q[1], q[4];
cx q[4], q[7];
cx q[7], q[6];
cx q[7], q[4];
cx q[6], q[7];
cx q[1], q[0];
