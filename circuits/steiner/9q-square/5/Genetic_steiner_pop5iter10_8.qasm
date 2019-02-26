// Initial wiring: [0, 4, 5, 6, 2, 1, 3, 8, 7]
// Resulting wiring: [0, 4, 5, 6, 2, 1, 3, 8, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[8], q[7];
cx q[7], q[4];
cx q[6], q[7];
cx q[3], q[2];
