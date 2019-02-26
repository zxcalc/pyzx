// Initial wiring: [0, 7, 6, 8, 1, 2, 4, 5, 3]
// Resulting wiring: [0, 7, 6, 8, 1, 2, 4, 5, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[0], q[5];
cx q[7], q[8];
cx q[7], q[6];
cx q[3], q[2];
