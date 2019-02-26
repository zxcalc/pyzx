// Initial wiring: [1, 6, 2, 3, 4, 5, 8, 7, 0]
// Resulting wiring: [1, 6, 2, 3, 4, 5, 8, 7, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[5], q[6];
cx q[4], q[5];
cx q[4], q[7];
