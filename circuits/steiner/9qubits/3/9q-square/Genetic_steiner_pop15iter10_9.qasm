// Initial wiring: [5, 0, 2, 4, 6, 8, 3, 7, 1]
// Resulting wiring: [5, 0, 2, 4, 6, 8, 3, 7, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[7], q[4];
cx q[3], q[2];
