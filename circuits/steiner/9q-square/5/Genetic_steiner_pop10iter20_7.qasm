// Initial wiring: [7, 2, 0, 6, 8, 3, 4, 1, 5]
// Resulting wiring: [7, 2, 0, 6, 8, 3, 4, 1, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[2], q[3];
cx q[0], q[5];
cx q[7], q[8];
cx q[3], q[8];
