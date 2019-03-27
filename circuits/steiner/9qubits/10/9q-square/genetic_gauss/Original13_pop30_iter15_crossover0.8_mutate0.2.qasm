// Initial wiring: [3, 1, 0, 4, 8, 7, 6, 2, 5]
// Resulting wiring: [3, 1, 0, 4, 8, 7, 6, 2, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[0];
cx q[3], q[0];
cx q[5], q[3];
cx q[7], q[1];
cx q[6], q[2];
cx q[1], q[4];
cx q[5], q[7];
cx q[2], q[6];
