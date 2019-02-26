// Initial wiring: [3, 7, 0, 6, 4, 1, 5, 2, 8]
// Resulting wiring: [3, 7, 0, 6, 4, 1, 5, 2, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[6];
cx q[3], q[2];
cx q[5], q[0];
