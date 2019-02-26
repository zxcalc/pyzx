// Initial wiring: [0, 7, 3, 8, 2, 6, 5, 1, 4]
// Resulting wiring: [0, 7, 3, 8, 2, 6, 5, 1, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[1], q[4];
cx q[0], q[5];
cx q[5], q[6];
cx q[7], q[6];
