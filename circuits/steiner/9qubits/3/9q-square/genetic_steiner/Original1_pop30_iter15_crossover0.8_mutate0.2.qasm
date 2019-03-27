// Initial wiring: [4, 6, 0, 3, 7, 5, 1, 8, 2]
// Resulting wiring: [4, 6, 0, 3, 7, 5, 1, 8, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[7];
cx q[6], q[7];
cx q[4], q[7];
