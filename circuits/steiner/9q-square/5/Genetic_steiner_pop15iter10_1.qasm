// Initial wiring: [8, 0, 7, 1, 2, 6, 4, 3, 5]
// Resulting wiring: [8, 0, 7, 1, 2, 6, 4, 3, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[7];
cx q[7], q[8];
cx q[4], q[7];
cx q[7], q[8];
cx q[4], q[3];
cx q[7], q[4];
cx q[5], q[0];
cx q[1], q[0];
