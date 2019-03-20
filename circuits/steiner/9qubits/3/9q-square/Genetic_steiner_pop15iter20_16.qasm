// Initial wiring: [1, 2, 4, 0, 8, 5, 3, 7, 6]
// Resulting wiring: [1, 2, 4, 0, 8, 5, 3, 7, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[6];
cx q[7], q[4];
cx q[1], q[0];
