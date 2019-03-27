// Initial wiring: [1, 7, 6, 8, 4, 5, 0, 3, 2]
// Resulting wiring: [1, 7, 6, 8, 4, 5, 0, 3, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[2];
cx q[6], q[8];
cx q[2], q[4];
cx q[1], q[2];
cx q[2], q[1];
