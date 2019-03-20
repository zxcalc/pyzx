// Initial wiring: [7, 8, 0, 6, 1, 3, 5, 2, 4]
// Resulting wiring: [7, 8, 0, 6, 1, 3, 5, 2, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[6], q[5];
cx q[7], q[4];
