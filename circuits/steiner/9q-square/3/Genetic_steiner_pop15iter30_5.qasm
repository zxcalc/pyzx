// Initial wiring: [8, 3, 0, 6, 1, 5, 4, 7, 2]
// Resulting wiring: [8, 3, 0, 6, 1, 5, 4, 7, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[3], q[2];
cx q[4], q[1];
