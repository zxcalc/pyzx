// Initial wiring: [0, 7, 6, 3, 4, 2, 8, 5, 1]
// Resulting wiring: [0, 7, 6, 3, 4, 2, 8, 5, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[6];
cx q[3], q[8];
cx q[3], q[2];
