// Initial wiring: [8, 1, 6, 2, 3, 0, 5, 7, 4]
// Resulting wiring: [8, 1, 6, 2, 3, 0, 5, 7, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[0];
cx q[7], q[6];
cx q[2], q[6];
