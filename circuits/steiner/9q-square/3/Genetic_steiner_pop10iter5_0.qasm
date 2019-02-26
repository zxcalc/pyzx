// Initial wiring: [5, 1, 7, 8, 3, 6, 0, 4, 2]
// Resulting wiring: [5, 1, 7, 8, 3, 6, 0, 4, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[7];
cx q[2], q[1];
cx q[5], q[0];
