// Initial wiring: [3, 5, 6, 0, 2, 7, 8, 1, 4]
// Resulting wiring: [3, 5, 6, 0, 2, 7, 8, 1, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[6];
cx q[4], q[7];
cx q[1], q[0];
