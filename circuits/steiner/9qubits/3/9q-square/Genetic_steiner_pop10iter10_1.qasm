// Initial wiring: [0, 3, 5, 6, 1, 4, 2, 8, 7]
// Resulting wiring: [0, 3, 5, 6, 1, 4, 2, 8, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[7];
cx q[4], q[7];
cx q[8], q[7];
