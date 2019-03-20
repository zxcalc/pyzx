// Initial wiring: [2, 0, 3, 8, 5, 6, 1, 7, 4]
// Resulting wiring: [2, 0, 3, 8, 5, 6, 1, 7, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[7], q[4];
cx q[5], q[4];
