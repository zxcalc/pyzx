// Initial wiring: [8, 4, 3, 5, 6, 7, 0, 1, 2]
// Resulting wiring: [8, 4, 3, 5, 6, 7, 0, 1, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[0], q[5];
cx q[8], q[7];
