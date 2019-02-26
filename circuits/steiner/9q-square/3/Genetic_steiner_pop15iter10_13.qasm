// Initial wiring: [3, 7, 0, 4, 8, 5, 1, 2, 6]
// Resulting wiring: [3, 7, 0, 4, 8, 5, 1, 2, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[6];
cx q[4], q[3];
cx q[4], q[1];
