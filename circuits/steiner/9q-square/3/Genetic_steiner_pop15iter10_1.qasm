// Initial wiring: [4, 3, 0, 6, 2, 5, 7, 8, 1]
// Resulting wiring: [4, 3, 0, 6, 2, 5, 7, 8, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[7];
cx q[4], q[7];
cx q[8], q[7];
