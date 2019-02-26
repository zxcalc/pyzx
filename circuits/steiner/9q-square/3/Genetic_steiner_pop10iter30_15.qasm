// Initial wiring: [2, 1, 6, 7, 3, 4, 8, 5, 0]
// Resulting wiring: [2, 1, 6, 7, 3, 4, 8, 5, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[7];
cx q[5], q[4];
cx q[4], q[1];
