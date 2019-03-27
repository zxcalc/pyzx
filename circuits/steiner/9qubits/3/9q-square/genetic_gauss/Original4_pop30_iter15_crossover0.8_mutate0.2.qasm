// Initial wiring: [2, 3, 0, 6, 5, 7, 8, 4, 1]
// Resulting wiring: [2, 3, 0, 6, 5, 7, 8, 4, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[6];
cx q[7], q[5];
cx q[4], q[6];
