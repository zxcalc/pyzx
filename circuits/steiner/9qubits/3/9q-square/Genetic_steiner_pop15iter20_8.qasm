// Initial wiring: [0, 5, 7, 2, 4, 6, 1, 3, 8]
// Resulting wiring: [0, 5, 7, 2, 4, 6, 1, 3, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[4], q[3];
cx q[4], q[1];
