// Initial wiring: [1, 0, 8, 3, 7, 6, 2, 4, 5]
// Resulting wiring: [1, 0, 8, 3, 7, 6, 2, 4, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[6];
cx q[7], q[5];
cx q[4], q[5];
