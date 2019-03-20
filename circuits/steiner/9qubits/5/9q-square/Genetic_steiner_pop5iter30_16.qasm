// Initial wiring: [8, 2, 4, 5, 1, 3, 7, 0, 6]
// Resulting wiring: [8, 2, 4, 5, 1, 3, 7, 0, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[4];
cx q[4], q[5];
cx q[5], q[6];
cx q[4], q[7];
cx q[1], q[4];
cx q[7], q[6];
cx q[4], q[1];
