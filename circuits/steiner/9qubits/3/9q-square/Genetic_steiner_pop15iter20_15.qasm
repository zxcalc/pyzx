// Initial wiring: [7, 0, 1, 3, 4, 8, 5, 2, 6]
// Resulting wiring: [7, 0, 1, 3, 4, 8, 5, 2, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[6];
cx q[4], q[3];
cx q[3], q[2];
