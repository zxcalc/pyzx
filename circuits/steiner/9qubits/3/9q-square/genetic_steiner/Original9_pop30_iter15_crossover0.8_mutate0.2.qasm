// Initial wiring: [8, 0, 3, 2, 4, 1, 5, 6, 7]
// Resulting wiring: [8, 0, 3, 2, 4, 1, 5, 6, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[3];
cx q[8], q[7];
cx q[4], q[7];
