// Initial wiring: [5, 2, 0, 3, 1, 6, 7, 8, 4]
// Resulting wiring: [5, 2, 0, 3, 1, 6, 7, 8, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[4];
cx q[7], q[8];
cx q[7], q[6];
