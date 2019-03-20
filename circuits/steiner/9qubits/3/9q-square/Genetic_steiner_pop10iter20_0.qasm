// Initial wiring: [7, 0, 2, 4, 5, 1, 8, 6, 3]
// Resulting wiring: [7, 0, 2, 4, 5, 1, 8, 6, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[0], q[5];
cx q[7], q[4];
