// Initial wiring: [0, 8, 1, 3, 2, 5, 7, 4, 6]
// Resulting wiring: [0, 8, 1, 3, 2, 5, 7, 4, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[0];
cx q[3], q[2];
cx q[4], q[2];
cx q[4], q[1];
cx q[5], q[3];
cx q[6], q[3];
cx q[7], q[3];
cx q[3], q[8];
cx q[1], q[3];
