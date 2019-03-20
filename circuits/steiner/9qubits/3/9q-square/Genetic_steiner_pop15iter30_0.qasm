// Initial wiring: [4, 2, 8, 5, 3, 0, 7, 1, 6]
// Resulting wiring: [4, 2, 8, 5, 3, 0, 7, 1, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[7];
cx q[8], q[3];
cx q[1], q[0];
