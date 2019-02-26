// Initial wiring: [7, 5, 3, 6, 0, 2, 1, 8, 4]
// Resulting wiring: [7, 5, 3, 6, 0, 2, 1, 8, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[3];
cx q[2], q[1];
cx q[1], q[0];
