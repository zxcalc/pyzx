// Initial wiring: [4, 1, 3, 7, 5, 8, 2, 0, 6]
// Resulting wiring: [4, 1, 3, 7, 5, 8, 2, 0, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[1], q[4];
cx q[8], q[7];
