// Initial wiring: [8, 3, 5, 6, 0, 2, 4, 7, 1]
// Resulting wiring: [8, 3, 5, 6, 0, 2, 4, 7, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[6];
cx q[7], q[8];
cx q[3], q[2];
