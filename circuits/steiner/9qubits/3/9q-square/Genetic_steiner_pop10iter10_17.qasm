// Initial wiring: [5, 6, 0, 1, 8, 7, 4, 2, 3]
// Resulting wiring: [5, 6, 0, 1, 8, 7, 4, 2, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[5];
cx q[6], q[7];
cx q[8], q[7];
