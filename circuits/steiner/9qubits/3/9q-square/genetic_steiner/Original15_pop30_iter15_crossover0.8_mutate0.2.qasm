// Initial wiring: [8, 5, 1, 3, 7, 2, 6, 0, 4]
// Resulting wiring: [8, 5, 1, 3, 7, 2, 6, 0, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[3];
cx q[3], q[2];
cx q[0], q[1];
