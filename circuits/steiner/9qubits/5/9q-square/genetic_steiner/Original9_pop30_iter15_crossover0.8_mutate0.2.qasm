// Initial wiring: [2, 3, 0, 4, 7, 6, 8, 5, 1]
// Resulting wiring: [2, 3, 0, 4, 7, 6, 8, 5, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[4];
cx q[8], q[3];
cx q[5], q[6];
cx q[1], q[2];
cx q[0], q[5];
