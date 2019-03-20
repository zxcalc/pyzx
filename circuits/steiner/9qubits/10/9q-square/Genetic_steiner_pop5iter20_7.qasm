// Initial wiring: [5, 7, 8, 3, 4, 6, 1, 0, 2]
// Resulting wiring: [5, 7, 8, 3, 4, 6, 1, 0, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[5], q[6];
cx q[6], q[7];
cx q[5], q[6];
cx q[0], q[5];
cx q[6], q[7];
cx q[6], q[5];
cx q[5], q[4];
cx q[7], q[4];
cx q[6], q[5];
cx q[4], q[1];
cx q[5], q[4];
