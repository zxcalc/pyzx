// Initial wiring: [0, 7, 4, 2, 6, 8, 5, 1, 3]
// Resulting wiring: [0, 7, 4, 2, 6, 8, 5, 1, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[1], q[2];
cx q[0], q[1];
cx q[7], q[6];
cx q[8], q[7];
cx q[1], q[0];
