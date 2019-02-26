// Initial wiring: [1, 8, 6, 0, 2, 5, 4, 3, 7]
// Resulting wiring: [1, 8, 6, 0, 2, 5, 4, 3, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[6], q[7];
cx q[6], q[5];
