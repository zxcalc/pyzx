// Initial wiring: [4, 8, 1, 3, 5, 2, 6, 0, 7]
// Resulting wiring: [4, 8, 1, 3, 5, 2, 6, 0, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[2], q[3];
cx q[3], q[4];
cx q[6], q[7];
