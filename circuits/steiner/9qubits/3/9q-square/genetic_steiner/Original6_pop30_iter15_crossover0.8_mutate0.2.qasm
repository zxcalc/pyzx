// Initial wiring: [1, 4, 0, 7, 2, 3, 6, 8, 5]
// Resulting wiring: [1, 4, 0, 7, 2, 3, 6, 8, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[0];
cx q[5], q[6];
cx q[4], q[7];
