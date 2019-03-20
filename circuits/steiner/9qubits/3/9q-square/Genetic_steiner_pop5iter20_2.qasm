// Initial wiring: [7, 0, 8, 6, 1, 3, 2, 4, 5]
// Resulting wiring: [7, 0, 8, 6, 1, 3, 2, 4, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[8];
cx q[6], q[5];
cx q[4], q[3];
