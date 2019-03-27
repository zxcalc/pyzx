// Initial wiring: [1, 8, 5, 7, 3, 0, 4, 6, 2]
// Resulting wiring: [1, 8, 5, 7, 3, 0, 4, 6, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[0];
cx q[5], q[1];
cx q[5], q[0];
cx q[7], q[4];
cx q[3], q[7];
cx q[1], q[5];
cx q[1], q[3];
cx q[0], q[4];
cx q[3], q[6];
