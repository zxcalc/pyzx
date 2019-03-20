// Initial wiring: [0, 4, 6, 3, 1, 2, 7, 8, 5]
// Resulting wiring: [0, 4, 6, 3, 1, 2, 7, 8, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[6];
cx q[6], q[7];
cx q[5], q[6];
cx q[4], q[7];
