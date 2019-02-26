// Initial wiring: [6, 4, 1, 7, 5, 8, 2, 0, 3]
// Resulting wiring: [6, 4, 1, 7, 5, 8, 2, 0, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[4];
cx q[4], q[7];
cx q[7], q[8];
cx q[4], q[7];
cx q[1], q[4];
cx q[0], q[1];
cx q[8], q[3];
cx q[4], q[1];
