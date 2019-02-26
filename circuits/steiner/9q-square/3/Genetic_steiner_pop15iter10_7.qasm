// Initial wiring: [0, 8, 4, 2, 3, 6, 7, 5, 1]
// Resulting wiring: [0, 8, 4, 2, 3, 6, 7, 5, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[5];
cx q[4], q[7];
cx q[7], q[6];
