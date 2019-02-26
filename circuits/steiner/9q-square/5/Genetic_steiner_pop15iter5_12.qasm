// Initial wiring: [5, 6, 4, 1, 0, 7, 2, 8, 3]
// Resulting wiring: [5, 6, 4, 1, 0, 7, 2, 8, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[1], q[2];
cx q[2], q[3];
cx q[4], q[7];
cx q[7], q[6];
cx q[2], q[1];
cx q[1], q[2];
cx q[1], q[0];
cx q[2], q[1];
cx q[1], q[2];
