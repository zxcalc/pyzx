// Initial wiring: [2, 4, 1, 7, 5, 3, 6, 0, 8]
// Resulting wiring: [2, 4, 1, 7, 5, 3, 6, 0, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[6];
cx q[5], q[4];
cx q[4], q[3];
