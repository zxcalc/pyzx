// Initial wiring: [5, 8, 2, 3, 7, 6, 1, 0, 4]
// Resulting wiring: [5, 8, 2, 3, 7, 6, 1, 0, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[1];
cx q[3], q[2];
cx q[2], q[1];
cx q[4], q[1];
cx q[5], q[0];
cx q[7], q[8];
cx q[1], q[2];
