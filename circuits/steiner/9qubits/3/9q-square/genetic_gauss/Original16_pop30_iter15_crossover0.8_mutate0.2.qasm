// Initial wiring: [7, 5, 2, 6, 4, 0, 1, 8, 3]
// Resulting wiring: [7, 5, 2, 6, 4, 0, 1, 8, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[8];
cx q[0], q[7];
cx q[2], q[6];
