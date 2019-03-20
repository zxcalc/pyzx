// Initial wiring: [0, 6, 2, 8, 4, 3, 1, 7, 5]
// Resulting wiring: [0, 6, 2, 8, 4, 3, 1, 7, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[4];
cx q[4], q[5];
cx q[1], q[4];
cx q[4], q[5];
cx q[6], q[5];
cx q[7], q[6];
cx q[5], q[4];
cx q[3], q[2];
