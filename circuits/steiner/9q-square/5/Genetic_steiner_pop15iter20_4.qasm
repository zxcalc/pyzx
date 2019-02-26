// Initial wiring: [2, 1, 5, 4, 7, 0, 8, 6, 3]
// Resulting wiring: [2, 1, 5, 4, 7, 0, 8, 6, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[4];
cx q[5], q[6];
cx q[7], q[8];
cx q[8], q[3];
cx q[5], q[0];
