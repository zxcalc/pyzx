// Initial wiring: [2, 6, 1, 7, 5, 3, 8, 0, 4]
// Resulting wiring: [2, 6, 1, 7, 5, 3, 8, 0, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[1], q[4];
cx q[5], q[6];
