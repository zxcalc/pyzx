// Initial wiring: [6, 0, 7, 2, 1, 4, 8, 3, 5]
// Resulting wiring: [6, 0, 7, 2, 1, 4, 8, 3, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[0];
cx q[7], q[0];
cx q[8], q[7];
cx q[8], q[6];
cx q[8], q[2];
cx q[4], q[7];
cx q[0], q[4];
