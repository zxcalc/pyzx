// Initial wiring: [5, 3, 0, 6, 2, 4, 8, 7, 1]
// Resulting wiring: [5, 3, 0, 6, 2, 4, 8, 7, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[4];
cx q[8], q[3];
cx q[3], q[4];
cx q[1], q[4];
cx q[0], q[5];
