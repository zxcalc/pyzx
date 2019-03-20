// Initial wiring: [1, 4, 8, 0, 2, 7, 5, 6, 3]
// Resulting wiring: [1, 4, 8, 0, 2, 7, 5, 6, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[6];
cx q[4], q[1];
cx q[5], q[0];
