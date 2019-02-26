// Initial wiring: [3, 1, 0, 7, 4, 6, 2, 8, 5]
// Resulting wiring: [3, 1, 0, 7, 4, 6, 2, 8, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[0], q[5];
cx q[6], q[7];
