// Initial wiring: [7, 8, 4, 5, 3, 2, 1, 0, 6]
// Resulting wiring: [7, 8, 4, 5, 3, 2, 1, 0, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[0];
cx q[5], q[6];
cx q[1], q[2];
