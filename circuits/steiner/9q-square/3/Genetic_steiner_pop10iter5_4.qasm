// Initial wiring: [3, 4, 6, 5, 8, 1, 0, 7, 2]
// Resulting wiring: [3, 4, 6, 5, 8, 1, 0, 7, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[4], q[7];
cx q[1], q[4];
cx q[4], q[7];
