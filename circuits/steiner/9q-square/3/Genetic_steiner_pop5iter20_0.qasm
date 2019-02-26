// Initial wiring: [7, 1, 3, 5, 8, 2, 4, 0, 6]
// Resulting wiring: [7, 1, 3, 5, 8, 2, 4, 0, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[5], q[6];
cx q[8], q[3];
