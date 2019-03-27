// Initial wiring: [8, 5, 6, 1, 7, 3, 0, 2, 4]
// Resulting wiring: [8, 5, 6, 1, 7, 3, 0, 2, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[1];
cx q[4], q[3];
cx q[7], q[8];
