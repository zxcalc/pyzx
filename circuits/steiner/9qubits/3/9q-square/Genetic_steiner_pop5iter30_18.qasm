// Initial wiring: [5, 7, 2, 0, 4, 6, 8, 3, 1]
// Resulting wiring: [5, 7, 2, 0, 4, 6, 8, 3, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[3], q[2];
cx q[4], q[1];
