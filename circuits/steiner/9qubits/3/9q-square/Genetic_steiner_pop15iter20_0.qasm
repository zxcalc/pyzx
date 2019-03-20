// Initial wiring: [4, 3, 1, 7, 8, 2, 6, 5, 0]
// Resulting wiring: [4, 3, 1, 7, 8, 2, 6, 5, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[7];
cx q[3], q[2];
cx q[5], q[0];
