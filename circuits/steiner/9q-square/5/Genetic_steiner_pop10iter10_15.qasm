// Initial wiring: [2, 0, 3, 5, 8, 4, 7, 6, 1]
// Resulting wiring: [2, 0, 3, 5, 8, 4, 7, 6, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[5], q[6];
cx q[4], q[7];
cx q[7], q[8];
cx q[4], q[1];
