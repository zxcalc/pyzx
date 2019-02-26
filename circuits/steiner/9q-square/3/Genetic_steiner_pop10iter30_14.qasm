// Initial wiring: [7, 2, 6, 0, 5, 1, 8, 4, 3]
// Resulting wiring: [7, 2, 6, 0, 5, 1, 8, 4, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[7], q[8];
cx q[7], q[4];
