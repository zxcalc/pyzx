// Initial wiring: [6, 3, 4, 1, 2, 7, 8, 5, 0]
// Resulting wiring: [6, 3, 4, 1, 2, 7, 8, 5, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[2], q[3];
cx q[1], q[2];
cx q[6], q[7];
cx q[2], q[1];
