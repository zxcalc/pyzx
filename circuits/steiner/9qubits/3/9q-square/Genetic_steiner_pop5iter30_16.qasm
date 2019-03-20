// Initial wiring: [7, 5, 0, 1, 3, 8, 4, 6, 2]
// Resulting wiring: [7, 5, 0, 1, 3, 8, 4, 6, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[4];
cx q[0], q[5];
cx q[8], q[3];
