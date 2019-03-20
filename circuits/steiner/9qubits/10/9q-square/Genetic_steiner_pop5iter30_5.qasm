// Initial wiring: [8, 6, 4, 2, 3, 5, 7, 1, 0]
// Resulting wiring: [8, 6, 4, 2, 3, 5, 7, 1, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[1], q[4];
cx q[5], q[6];
cx q[4], q[7];
cx q[1], q[4];
cx q[4], q[1];
cx q[7], q[4];
cx q[5], q[4];
cx q[1], q[4];
cx q[5], q[0];
