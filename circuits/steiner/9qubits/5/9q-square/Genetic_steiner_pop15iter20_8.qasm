// Initial wiring: [3, 2, 8, 7, 1, 6, 5, 0, 4]
// Resulting wiring: [3, 2, 8, 7, 1, 6, 5, 0, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[0], q[1];
cx q[1], q[2];
cx q[5], q[6];
cx q[7], q[8];
cx q[3], q[2];
cx q[2], q[1];
