// Initial wiring: [3, 0, 8, 5, 4, 7, 1, 2, 6]
// Resulting wiring: [3, 0, 8, 5, 4, 7, 1, 2, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[6];
cx q[7], q[4];
cx q[8], q[3];
