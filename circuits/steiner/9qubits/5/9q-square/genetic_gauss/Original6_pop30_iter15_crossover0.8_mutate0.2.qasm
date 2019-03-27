// Initial wiring: [0, 8, 7, 4, 2, 3, 6, 5, 1]
// Resulting wiring: [0, 8, 7, 4, 2, 3, 6, 5, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[0];
cx q[5], q[4];
cx q[6], q[2];
cx q[3], q[8];
cx q[0], q[8];
