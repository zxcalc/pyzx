// Initial wiring: [2, 3, 1, 7, 6, 5, 0, 8, 4]
// Resulting wiring: [2, 3, 1, 7, 6, 5, 0, 8, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[1], q[2];
cx q[0], q[1];
cx q[1], q[2];
cx q[0], q[5];
cx q[6], q[7];
cx q[4], q[7];
cx q[1], q[0];
