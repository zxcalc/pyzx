// Initial wiring: [7, 0, 1, 6, 5, 3, 2, 4, 8]
// Resulting wiring: [7, 0, 1, 6, 5, 3, 2, 4, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[1], q[4];
cx q[1], q[0];
