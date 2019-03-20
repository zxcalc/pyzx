// Initial wiring: [7, 5, 4, 2, 3, 1, 0, 6, 8]
// Resulting wiring: [7, 5, 4, 2, 3, 1, 0, 6, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[4], q[3];
cx q[1], q[0];
