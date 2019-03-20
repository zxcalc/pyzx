// Initial wiring: [8, 0, 6, 5, 4, 2, 3, 7, 1]
// Resulting wiring: [8, 0, 6, 5, 4, 2, 3, 7, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[7], q[8];
cx q[5], q[4];
