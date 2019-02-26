// Initial wiring: [2, 8, 0, 7, 1, 3, 4, 6, 5]
// Resulting wiring: [2, 8, 0, 7, 1, 3, 4, 6, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[5], q[6];
cx q[6], q[7];
cx q[5], q[6];
cx q[6], q[7];
cx q[5], q[4];
