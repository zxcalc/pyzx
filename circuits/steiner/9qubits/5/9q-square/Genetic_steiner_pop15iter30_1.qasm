// Initial wiring: [2, 1, 5, 8, 4, 3, 7, 6, 0]
// Resulting wiring: [2, 1, 5, 8, 4, 3, 7, 6, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[0], q[1];
cx q[1], q[2];
cx q[7], q[8];
cx q[8], q[3];
cx q[7], q[8];
cx q[5], q[0];
