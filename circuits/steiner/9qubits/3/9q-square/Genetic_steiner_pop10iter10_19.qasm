// Initial wiring: [3, 2, 4, 1, 5, 6, 7, 0, 8]
// Resulting wiring: [3, 2, 4, 1, 5, 6, 7, 0, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[6];
cx q[7], q[4];
cx q[5], q[4];
