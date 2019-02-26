// Initial wiring: [1, 5, 6, 0, 3, 4, 2, 7, 8]
// Resulting wiring: [1, 5, 6, 0, 3, 4, 2, 7, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[7], q[6];
cx q[7], q[4];
cx q[3], q[2];
cx q[2], q[1];
