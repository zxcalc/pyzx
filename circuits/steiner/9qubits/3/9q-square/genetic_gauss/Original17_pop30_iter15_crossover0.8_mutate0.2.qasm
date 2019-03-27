// Initial wiring: [1, 4, 8, 6, 7, 0, 2, 3, 5]
// Resulting wiring: [1, 4, 8, 6, 7, 0, 2, 3, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[6];
cx q[8], q[4];
cx q[1], q[6];
