// Initial wiring: [0, 1, 8, 7, 5, 4, 6, 2, 3]
// Resulting wiring: [0, 1, 8, 7, 5, 4, 6, 2, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[7];
cx q[5], q[6];
cx q[6], q[7];
cx q[5], q[4];
