// Initial wiring: [3, 2, 7, 1, 5, 6, 4, 8, 0]
// Resulting wiring: [3, 2, 7, 1, 5, 6, 4, 8, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[6], q[7];
cx q[5], q[0];
