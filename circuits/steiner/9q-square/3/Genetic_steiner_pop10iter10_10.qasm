// Initial wiring: [7, 3, 0, 1, 8, 2, 4, 6, 5]
// Resulting wiring: [7, 3, 0, 1, 8, 2, 4, 6, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[7], q[8];
cx q[8], q[3];
cx q[7], q[8];
