// Initial wiring: [2, 1, 3, 4, 8, 6, 5, 7, 0]
// Resulting wiring: [2, 1, 3, 4, 8, 6, 5, 7, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[4], q[7];
cx q[4], q[3];
