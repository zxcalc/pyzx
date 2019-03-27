// Initial wiring: [5, 3, 4, 7, 6, 1, 0, 8, 2]
// Resulting wiring: [5, 3, 4, 7, 6, 1, 0, 8, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[0];
cx q[7], q[6];
cx q[6], q[2];
cx q[7], q[3];
cx q[6], q[5];
cx q[2], q[7];
cx q[1], q[5];
cx q[1], q[2];
cx q[0], q[2];
cx q[0], q[1];
cx q[1], q[8];
