// Initial wiring: [0, 6, 3, 5, 7, 8, 4, 1, 2]
// Resulting wiring: [0, 6, 3, 5, 7, 8, 4, 1, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[6];
cx q[8], q[7];
cx q[5], q[4];
