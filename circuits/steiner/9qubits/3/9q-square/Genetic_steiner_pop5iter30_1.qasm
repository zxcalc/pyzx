// Initial wiring: [0, 4, 2, 1, 5, 3, 6, 7, 8]
// Resulting wiring: [0, 4, 2, 1, 5, 3, 6, 7, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[3], q[8];
cx q[7], q[8];
cx q[2], q[3];
