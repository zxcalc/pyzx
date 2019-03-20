// Initial wiring: [1, 4, 2, 6, 0, 3, 8, 7, 5]
// Resulting wiring: [1, 4, 2, 6, 0, 3, 8, 7, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[6];
cx q[7], q[8];
cx q[3], q[8];
