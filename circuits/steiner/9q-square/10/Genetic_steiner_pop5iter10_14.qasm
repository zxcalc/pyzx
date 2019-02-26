// Initial wiring: [3, 7, 1, 8, 0, 6, 2, 5, 4]
// Resulting wiring: [3, 7, 1, 8, 0, 6, 2, 5, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[1], q[2];
cx q[1], q[4];
cx q[4], q[7];
cx q[1], q[4];
cx q[0], q[1];
cx q[4], q[7];
cx q[4], q[1];
cx q[7], q[4];
cx q[4], q[7];
cx q[1], q[0];
cx q[4], q[1];
cx q[7], q[4];
cx q[4], q[7];
