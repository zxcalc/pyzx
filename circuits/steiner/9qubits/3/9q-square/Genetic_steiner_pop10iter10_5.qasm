// Initial wiring: [0, 6, 8, 7, 1, 5, 2, 3, 4]
// Resulting wiring: [0, 6, 8, 7, 1, 5, 2, 3, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[4], q[7];
cx q[1], q[0];
