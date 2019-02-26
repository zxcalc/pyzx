// Initial wiring: [8, 6, 2, 0, 3, 4, 1, 7, 5]
// Resulting wiring: [8, 6, 2, 0, 3, 4, 1, 7, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[4];
cx q[4], q[7];
cx q[1], q[4];
cx q[4], q[7];
cx q[6], q[5];
cx q[4], q[3];
cx q[1], q[0];
cx q[2], q[1];
