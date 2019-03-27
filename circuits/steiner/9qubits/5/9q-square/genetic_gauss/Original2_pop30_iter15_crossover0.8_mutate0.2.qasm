// Initial wiring: [5, 7, 2, 4, 1, 6, 8, 0, 3]
// Resulting wiring: [5, 7, 2, 4, 1, 6, 8, 0, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[2];
cx q[6], q[8];
cx q[4], q[6];
cx q[6], q[4];
