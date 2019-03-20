// Initial wiring: [1, 3, 2, 6, 5, 0, 7, 4, 8]
// Resulting wiring: [1, 3, 2, 6, 5, 0, 7, 4, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[5], q[6];
cx q[5], q[4];
