// Initial wiring: [1, 8, 2, 3, 7, 4, 5, 0, 6]
// Resulting wiring: [1, 8, 2, 3, 7, 4, 5, 0, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[3], q[8];
cx q[1], q[0];
cx q[2], q[1];
cx q[3], q[2];
